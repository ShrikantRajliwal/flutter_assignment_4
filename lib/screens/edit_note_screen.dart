import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_assignment_4/models/note_model.dart';
import 'package:flutter_assignment_4/providers/data_provider.dart';
import 'package:provider/provider.dart';

class EditNoteScreen extends StatefulWidget {
  final NoteModel note;
  int index;

  EditNoteScreen({required this.note, required this.index, super.key});

  @override
  State<EditNoteScreen> createState() => _EditNoteScreenState();
}

class _EditNoteScreenState extends State<EditNoteScreen> {
  late TextEditingController titleController;
  late TextEditingController descriptionController;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.note.title);
    descriptionController = TextEditingController(
      text: widget.note.description,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Color(0xFF252525),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 25.0),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Color(0XFF3B3B3B),

                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: Icon(Icons.visibility, color: Colors.white),
                  ),
                ),
                SizedBox(width: 21),
                Consumer<DataProvider>(
                  builder: (context, itemValue, child) => GestureDetector(
                    onTap: () {
                      print(itemValue.noteList.length);
                      itemValue.editNote(
                        NoteModel(
                          description: descriptionController.text,
                          title: titleController.text,
                          index: widget.index,
                        ),
                      );
                      titleController.clear();
                      descriptionController.clear();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0XFF3B3B3B),

                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(13.0),
                        child: Icon(Icons.edit, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              style: TextStyle(color: Colors.white, fontSize: 35),
              decoration: InputDecoration(
                border: OutlineInputBorder(borderSide: BorderSide.none),
                hint: Text(
                  "Title",
                  style: TextStyle(fontSize: 43, color: Color(0XFF9A9A9A)),
                ),
              ),
            ),
            TextField(
              controller: descriptionController,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              style: TextStyle(color: Colors.white, fontSize: 23),
              decoration: InputDecoration(
                border: OutlineInputBorder(borderSide: BorderSide.none),
                hint: Text(
                  "Type Something...",
                  style: TextStyle(fontSize: 23, color: Color(0XFF9A9A9A)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
