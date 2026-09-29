import 'package:flutter/material.dart';
import '../models/announcement.dart';

class AnnouncementCard extends StatelessWidget {
  const AnnouncementCard({
    super.key,
    required this.announcement,
    required this.onTap,
  });

  final Announcement announcement;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final ColorScheme warna = Theme.of(context).colorScheme;

    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 12, left: 16, right: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
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
              const SizedBox(height: 12),
              Text(
                announcement.title,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 8),
              Text(
                announcement.content,
                style: TextStyle(fontSize: 14, color: warna.onSurfaceVariant),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}