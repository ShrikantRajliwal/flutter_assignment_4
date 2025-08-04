import 'package:flutter/material.dart';
import 'package:flutter_assignment_4/models/note_model.dart';
import 'dart:math';

Random random = Random();

class DataProvider extends ChangeNotifier {
  List<NoteModel> noteList = [];
  List<Color> colorList = [
    Color(0XFFFD99FF),
    Color(0XFFFF9E9E),
    Color(0XFF91F48F),
    Color(0XFFFFF599),
    Color(0XFF9EFFFF),
    Color(0XFFB69CFF),
  ];

  void addNote(NoteModel note) {
    noteList.add(note);
    notifyListeners();
  }

  void editNote(NoteModel note) {
    noteList[note.index].title = note.title;
    noteList[note.index].description = note.description;
    notifyListeners();
  }

  Color getColor() {
    return colorList[Random().nextInt(colorList.length)];
  }

  void deleteNote(int index) {
    noteList.removeAt(index);
    notifyListeners();
  }
}
