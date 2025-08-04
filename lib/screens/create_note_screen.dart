import 'package:flutter/material.dart';
import 'package:flutter_assignment_4/models/note_model.dart';
import 'package:flutter_assignment_4/providers/data_provider.dart';
import 'package:provider/provider.dart';

final _formkey = GlobalKey<FormState>();

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
                          return Center(
                            child: AlertDialog(
                              backgroundColor: Color(0Xff252525),
                              title: Icon(Icons.info),
                              content: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Save changes ?',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 23,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
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
                                              BorderRadiusGeometry.circular(7),
                                        ),
                                      ),

                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 8,
                                          vertical: 0,
                                        ),
                                        child: Text(
                                          'Discard',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                      onPressed: () {
                                        // Navigator.of(context).pop();
                                      },
                                    ),
                                    SizedBox(width: 25),
                                    TextButton(
                                      style: TextButton.styleFrom(
                                        backgroundColor: Color.fromARGB(
                                          255,
                                          85,
                                          231,
                                          66,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadiusGeometry.circular(7),
                                        ),
                                      ),
                                      onPressed: () {
                                        if (_formkey.currentState!.validate()) {
                                          itemValue.addNote(
                                            NoteModel(
                                              description:
                                                  descriptionController.text,
                                              title: titleController.text,
                                              index: 0,
                                            ),
                                          );
                                        }

                                        titleController.clear();
                                        descriptionController.clear();
                                        Navigator.pop(context);
                                        Navigator.pop(context);
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 12,
                                          vertical: 0,
                                        ),
                                        child: Text(
                                          'Save',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
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
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              TextFormField(
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
                validator: (title) =>
                    titleController.text.isEmpty ? "Title cant be empty" : null,
              ),
              TextFormField(
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
      ),
    );
  }
}
