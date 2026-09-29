import 'package:flutter/material.dart';
import '../models/announcement.dart';
import '../services/announcement_api.dart';
import '../widgets/announcement_card.dart';
import 'announcement_detail_screen.dart';

class AnnouncementListScreen extends StatefulWidget {
  const AnnouncementListScreen({super.key, this.api});
  final AnnouncementApi? api;

  @override
  State<AnnouncementListScreen> createState() => _AnnouncementListScreenState();
}

class _AnnouncementListScreenState extends State<AnnouncementListScreen> {
  static const List<String> _kategori = <String>['Semua', 'Akademik', 'Beasiswa', 'Kegiatan', 'Prestasi'];
  late final AnnouncementApi _api = widget.api ?? AnnouncementApi();
  late Future<List<Announcement>> _futurePengumuman;
  String _kategoriTerpilih = 'Semua';

  @override
  void initState() {
    super.initState();
    _futurePengumuman = _api.ambilPengumuman();
  }

  @override
  void dispose() {
    _api.tutup();
    super.dispose();
  }

  Future<void> _muatUlang() async {
    final Future<List<Announcement>> futureBaru = _api.ambilPengumuman();
    setState(() {
      _futurePengumuman = futureBaru;
    });
    try {
      await futureBaru;
    } catch (_) {}
  }

  void _pilihKategori(String kategori) {
    if (kategori == _kategoriTerpilih) return;
    setState(() => _kategoriTerpilih = kategori);
  }

  void _bukaDetail(Announcement announcement) {
    Navigator.push(
      context,
      MaterialPageRoute<void>(builder: (_) => AnnouncementDetailScreen(announcement: announcement)),
    );
  }

  Widget _buildBarisFilter() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: _kategori.map((String kategori) {
          final bool terpilih = kategori == _kategoriTerpilih;
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: ChoiceChip(
              label: Text(kategori),
              selected: terpilih,
              onSelected: (_) => _pilihKategori(kategori),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildMemuat() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          SizedBox(height: 16),
          Text('Memuat data dari server...'),
        ],
      ),
    );
  }

  Widget _buildGagal(Object error) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 48, color: Colors.red),
            const SizedBox(height: 16),
            Text(error.toString(), textAlign: TextAlign.center),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: _muatUlang,
              icon: const Icon(Icons.refresh),
              label: const Text('Coba Lagi'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildKosong() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.inbox, size: 64, color: Colors.grey),
          const SizedBox(height: 16),
          Text('Belum ada pengumuman untuk kategori $_kategoriTerpilih.'),
        ],
      ),
    );
  }

  Widget _buildDaftar(List<Announcement> tampil) {
    return RefreshIndicator(
      onRefresh: _muatUlang,
      child: ListView.builder(
        padding: const EdgeInsets.only(top: 8, bottom: 24),
        itemCount: tampil.length,
        itemBuilder: (context, index) {
          final item = tampil[index];
          return AnnouncementCard(
            announcement: item,
            onTap: () => _bukaDetail(item),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Portal Pengumuman TRPL'),
        actions: <Widget>[
          IconButton(icon: const Icon(Icons.refresh), tooltip: 'Segarkan Data', onPressed: _muatUlang),
        ],
      ),
      body: Column(
        children: <Widget>[
          _buildBarisFilter(),
          const Divider(height: 1),
          Expanded(
            child: FutureBuilder<List<Announcement>>(
              future: _futurePengumuman,
              builder: (context, snapshot) {
                if (snapshot.connectionState != ConnectionState.done) return _buildMemuat();
                if (snapshot.hasError) return _buildGagal(snapshot.error!);
                
                final List<Announcement> semua = snapshot.data ?? const <Announcement>[];
                final List<Announcement> tampil = _kategoriTerpilih == 'Semua'
                    ? semua
                    : semua.where((item) => item.category.toLowerCase() == _kategoriTerpilih.toLowerCase()).toList(growable: false);

                if (tampil.isEmpty) return _buildKosong();
                return _buildDaftar(tampil);
              },
            ),
          ),
        ],
      ),
    );
  }
}