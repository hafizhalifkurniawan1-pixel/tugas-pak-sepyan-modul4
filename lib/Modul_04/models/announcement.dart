class Announcement {
  final String id;
  final String title;
  final String content;
  final String author;
  final String category;
  final String date;
  final int readCount;

  Announcement({
    required this.id,
    required this.title,
    required this.content,
    required this.author,
    required this.category,
    required this.date,
    required this.readCount,
  });

  // Mengubah data JSON dari server menjadi object Announcement
  factory Announcement.fromJson(Map<String, dynamic> json) {
    return Announcement(
      id: json['id'].toString(),
      title: json['title'] ?? '',
      content: json['content'] ?? '',
      author: json['author'] ?? '',
      category: json['category'] ?? '',
      date: json['date'] ?? '',
      readCount: json['readCount'] ?? 0,
    );
  }

  // Data palsu untuk membuktikan Keadaan Simulasi (Offline)
  static List<Announcement> getSampleAnnouncements() {
    return [
      Announcement(
        id: '1',
        title: 'Jadwal Ujian Akhir Semester Ganjil 2026/2027',
        content: 'Pelaksanaan UAS akan dimulai pada tanggal 14 Desember 2026. Harap persiapkan diri dan pastikan syarat kehadiran terpenuhi.',
        author: 'Bagian Akademik Poliwangi',
        category: 'Akademik',
        date: '2026-09-01',
        readCount: 152,
      ),
      Announcement(
        id: '2',
        title: 'Pendaftaran Beasiswa Bank Indonesia Tahun 2026',
        content: 'Telah dibuka pendaftaran beasiswa BI. Syarat IPK minimal 3.00. Kumpulkan berkas paling lambat akhir bulan ini.',
        author: 'Bagian Kemahasiswaan',
        category: 'Beasiswa',
        date: '2026-09-05',
        readCount: 340,
      ),
      Announcement(
        id: '3',
        title: 'Lomba Inovasi Teknologi Tepat Guna Tingkat Nasional',
        content: 'Ayo daftarkan tim terbaikmu! Total hadiah puluhan juta rupiah. Pendaftaran ditutup 20 September.',
        author: 'Himpunan Mahasiswa',
        category: 'Prestasi',
        date: '2026-09-10',
        readCount: 89,
      ),
    ];
  }
}