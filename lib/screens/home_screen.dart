import 'package:flutter/material.dart';
import 'package:flutter_assignment_4/providers/data_provider.dart';
import 'package:flutter_assignment_4/screens/create_note_screen.dart';
import 'package:flutter_assignment_4/screens/edit_note_screen.dart';
import 'package:flutter_assignment_4/widgets/note_card.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            "Notes",

            style: TextStyle(
              fontSize: 43,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
        centerTitle: false,
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
                    child: Icon(Icons.search, color: Colors.white),
                  ),
                ),
                SizedBox(width: 21),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0XFF3B3B3B),

                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: Icon(Icons.info, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),

      body: Consumer<DataProvider>(
        builder: (context, dataItem, child) => dataItem.noteList.isEmpty
            ? Padding(
                padding: const EdgeInsets.only(bottom: 32),
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 183),
                      Image.asset("assets/home_screen.png"),
                      Text(
                        "Create your first note !",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w300,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : Padding(
                padding: const EdgeInsets.only(left: 24.0, right: 25, top: 10),
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              EditNoteScreen(note: dataItem.noteList[index],index:index),
                        ),
                      ),
                      child: NoteCard(
                        title: dataItem.noteList[index].title,
                        description: dataItem.noteList[index].description,
                      ),
                    );
                  },
                  separatorBuilder: (context, child) => SizedBox(height: 25),
                  itemCount: dataItem.noteList.length,
                ),
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (ctx) => CreateNoteScreen()),
          );
        },
        backgroundColor: Color.fromARGB(255, 58, 57, 57),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(100),
        ),
        child: Icon(Icons.add, size: 48, color: Colors.white),
      ),
    );
  }
}
