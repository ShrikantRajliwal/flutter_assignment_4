import 'package:flutter/material.dart';
import 'package:flutter_assignment_4/models/note_model.dart';
import 'package:flutter_assignment_4/providers/data_provider.dart';
import 'package:flutter_assignment_4/screens/edit_note_screen.dart';
import 'package:flutter_assignment_4/widgets/note_card.dart';
import 'package:provider/provider.dart';

class SearchNoteScreen extends StatefulWidget {
  const SearchNoteScreen({super.key});

  @override
  State<SearchNoteScreen> createState() => _SearchNoteScreenState();
}

class _SearchNoteScreenState extends State<SearchNoteScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<NoteModel> _filteredNotes = [];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _runFilter(String enteredKeyword, DataProvider provider) {
    List<NoteModel> results = [];
    if (enteredKeyword.isEmpty) {
      results = [];
    } else {
      results = provider.noteList
          .where(
            (note) =>
                note.title.toLowerCase().contains(
                  enteredKeyword.toLowerCase(),
                ) ||
                note.description.toLowerCase().contains(
                  enteredKeyword.toLowerCase(),
                ),
          )
          .toList();
    }

    setState(() {
      _filteredNotes = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<DataProvider>(context);

    return Scaffold(
      backgroundColor: const Color(0xFF252525),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: const Color(0xFF252525),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              autofocus: true,
              onChanged: (value) => _runFilter(value, dataProvider),
              style: const TextStyle(color: Colors.white, fontSize: 18),
              decoration: InputDecoration(
                hintText: "Search by the keyword...",
                hintStyle: const TextStyle(
                  fontSize: 18,
                  color: Color(0XFF9A9A9A),
                ),
                prefixIcon: const Icon(Icons.search, color: Color(0XFF9A9A9A)),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.close, color: Color(0XFFCCCCCC)),
                  onPressed: () {
                    _searchController.clear();
                    _runFilter('', dataProvider);
                  },
                ),
                filled: true,
                fillColor: const Color(0XFF3B3B3B),
                contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 20),
            if (_searchController.text.isNotEmpty && _filteredNotes.isEmpty)
              Expanded(
                child: Center(
                  child: Column(
                    children: [
                      Image.asset("assets/SearchScreenImage.png"),
                      Text(
                        "File not found.Try searching",
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
            else
              Expanded(
                child: ListView.separated(
                  itemCount: _filteredNotes.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 20),
                  itemBuilder: (context, index) {
                    final note = _filteredNotes[index];
                    final originalIndex = dataProvider.noteList.indexOf(note);
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EditNoteScreen(
                              note: note,
                              index: originalIndex,
                            ),
                          ),
                        ).then((_) {
                          if (mounted) {
                            _runFilter(_searchController.text, dataProvider);
                          }
                        });
                      },
                      child: NoteCard(
                        index: index,
                        color: Color(0XFFFFF599),
                        title: note.title,
                        description: note.description,
                        isDeleteMode: false,
                      ),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
