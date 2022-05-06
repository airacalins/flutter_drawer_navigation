// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

class Notes extends StatefulWidget {
  const Notes({ Key? key }) : super(key: key);

  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  final List<String> _notes = List.empty(growable: true);

  void _createNote(String title) {
    final newNote = title;

    setState(() {
      _notes.add(newNote);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('List of Notes Here'),
        CreateNote(_createNote)
      ],
    );
  }
}

class CreateNote extends StatefulWidget {
  final Function createNote;
  const CreateNote(this.createNote);

  @override
  State<CreateNote> createState() => _CreateNoteState();
}

class _CreateNoteState extends State<CreateNote> {
  final noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return 
      Column(children: [
        TextField(
        decoration: InputDecoration(labelText: 'Note'),
        controller: noteController,
      ),
      TextButton(
        child: Text('Add Note'),
        onPressed: () =>  print(widget.createNote(noteController.text))
      )]
    );
  }
}

