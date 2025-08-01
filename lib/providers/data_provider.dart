import 'package:flutter/material.dart';
import 'package:flutter_assignment_4/models/note_model.dart';

class DataProvider extends ChangeNotifier {
  List<NoteModel> noteList = [];

  void addNote(NoteModel note) {
    noteList.add(note);
    notifyListeners();
  }

  void editNote(NoteModel note) {
    noteList[note.index].title = note.title;
    noteList[note.index].description = note.description;
    notifyListeners();
  }
}
