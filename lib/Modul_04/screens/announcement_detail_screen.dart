import 'package:flutter/material.dart';
import '../models/announcement.dart';

class AnnouncementDetailScreen extends StatelessWidget {
  const AnnouncementDetailScreen({
    super.key,
    required this.announcement,
  });

  final Announcement announcement;

  @override
  Widget build(BuildContext context) {
    final ColorScheme warna = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Pengumuman'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: warna.primaryContainer,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    announcement.category,
                    style: TextStyle(
                      fontSize: 12,
                      color: warna.onPrimaryContainer,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  announcement.date,
                  style: TextStyle(fontSize: 12, color: warna.onSurfaceVariant),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              announcement.title,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.person_outline, size: 16, color: Colors.grey),
                const SizedBox(width: 4),
                Text(
                  announcement.author,
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                ),
                const SizedBox(width: 16),
                const Icon(Icons.visibility_outlined, size: 16, color: Colors.grey),
                const SizedBox(width: 4),
                Text(
                  '${announcement.readCount} kali dibaca',
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
            const Divider(height: 32),
            Text(
              announcement.content,
              style: const TextStyle(fontSize: 16, height: 1.5),
            ),
          ],
        ),
      ),
    );
  }
}