import 'package:flutter/material.dart';
import 'package:flutter_assignment_4/providers/data_provider.dart';
import 'package:flutter_assignment_4/screens/create_note_screen.dart';
import 'package:flutter_assignment_4/screens/edit_note_screen.dart';
import 'package:flutter_assignment_4/screens/search_note_screen.dart';
import 'package:flutter_assignment_4/widgets/note_card.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int? _longPressedIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF252525),
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(left: 8.0),
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
        backgroundColor: const Color(0xFF252525),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 25.0),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SearchNoteScreen()),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0XFF3B3B3B),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(13.0),
                      child: Icon(Icons.search, color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(width: 21),
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0XFF3B3B3B),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(13.0),
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
                      const SizedBox(height: 183),
                      Image.asset("assets/home_screen.png"),
                      const Text(
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
                    final isDeleteMode = _longPressedIndex == index;
                    return GestureDetector(
                      onLongPress: () {
                        setState(() {
                          _longPressedIndex = index;
                        });
                      },
                      onTap: () {
                        if (isDeleteMode) {
                          dataItem.deleteNote(index);
                          setState(() {
                            _longPressedIndex = null; 
                          });
                        } else {
                          setState(() {
                            _longPressedIndex = null;
                          });
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EditNoteScreen(
                                note: dataItem.noteList[index],
                                index: index,
                              ),
                            ),
                          );
                        }
                      },
                      child: NoteCard(
                        index: index,
                        isDeleteMode: isDeleteMode, 
                        color: dataItem.getColor(),
                        title: dataItem.noteList[index].title,
                        description: dataItem.noteList[index].description,
                      ),
                    );
                  },
                  separatorBuilder: (context, child) =>
                      const SizedBox(height: 25),
                  itemCount: dataItem.noteList.length,
                ),
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (ctx) => const CreateNoteScreen()),
          );
        },
        backgroundColor: const Color.fromARGB(255, 58, 57, 57),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        child: const Icon(Icons.add, size: 48, color: Colors.white),
      ),
    );
  }
}
