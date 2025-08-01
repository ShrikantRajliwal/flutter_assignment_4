import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NoteCard extends StatelessWidget {
  String title;
  String description;
  

  NoteCard({required this.title, required this.description, super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 25,
            color: Colors.black,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      textColor: Colors.white,
      tileColor: const Color.fromARGB(255, 240, 119, 110),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(10),
      ),
    );
  }
}
