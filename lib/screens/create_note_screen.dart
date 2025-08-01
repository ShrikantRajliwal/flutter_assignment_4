import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_assignment_4/models/note_model.dart';
import 'package:flutter_assignment_4/providers/data_provider.dart';
import 'package:provider/provider.dart';

class CreateNoteScreen extends StatelessWidget {
  const CreateNoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    final descriptionController = TextEditingController();

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
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            backgroundColor: Color(0Xff252525),
                            title: Icon(Icons.info),
                            content: Text(
                              'Are you sure you want to save?',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 23,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            actions: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextButton(
                                    style: TextButton.styleFrom(
                                      backgroundColor: Color.fromARGB(
                                        255,
                                        227,
                                        12,
                                        12,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadiusGeometry.circular(12),
                                      ),
                                    ),

                                    child: Text(
                                      'Discard',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    onPressed: () {
                                      // Navigator.of(context).pop();
                                    },
                                  ),
                                  SizedBox(width: 15),
                                  TextButton(
                                    child: Text(
                                      'Keep',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    style: TextButton.styleFrom(
                                      backgroundColor: Color.fromARGB(
                                        255,
                                        85,
                                        231,
                                        66,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadiusGeometry.circular(12),
                                      ),
                                    ),
                                    onPressed: () {
                                      // print(itemValue.noteList.length);
                                      itemValue.addNote(
                                        NoteModel(
                                          description:
                                              descriptionController.text,
                                          title: titleController.text,
                                          index: 0,
                                        ),
                                      );
                                      titleController.clear();
                                      descriptionController.clear();
                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0XFF3B3B3B),

                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(13.0),
                        child: Icon(Icons.save, color: Colors.white),
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
              // softWrap:true,
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



// print(itemValue.noteList.length);
//                       itemValue.addNote(
//                         NoteModel(
//                           description: descriptionController.text,
//                           title: titleController.text,
//                           index: 0
//                         ),
//                       );
//                       titleController.clear();
//                       descriptionController.clear();