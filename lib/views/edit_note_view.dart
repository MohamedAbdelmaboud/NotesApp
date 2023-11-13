import 'package:flutter/material.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/edit_view_body.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({super.key});
  static const String id = 'EditNoteView';

  @override
  Widget build(BuildContext context) {
    NoteModel noteModel = ModalRoute.of(context)!.settings.arguments as NoteModel;
    return Scaffold(
      body: EditViewBody(
        noteModel: noteModel,
      ),
    );
  }
}
