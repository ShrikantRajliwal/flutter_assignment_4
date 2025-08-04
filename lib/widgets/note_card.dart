import 'package:flutter/material.dart';

class NoteCard extends StatelessWidget {
  final String title;
  final String description;
  final Color color;
  final int index;
  final bool isDeleteMode; 

  const NoteCard({
    required this.title,
    required this.description,
    required this.color,
    required this.index,
    required this.isDeleteMode,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: isDeleteMode ? Colors.red : color,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      title: isDeleteMode
          ? const Center(
              child: Icon(Icons.delete, color: Colors.white, size: 36),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 8),
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
    );
  }
}
