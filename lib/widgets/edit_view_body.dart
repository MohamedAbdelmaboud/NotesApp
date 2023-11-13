import 'package:flutter/material.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/custom_app_bar.dart';
import 'package:notes_app/widgets/custom_text_field.dart';

class EditViewBody extends StatefulWidget {
  const EditViewBody({super.key, required this.noteModel});
    final NoteModel noteModel;
  @override
  State<EditViewBody> createState() => _EditViewBodyState();
}

class _EditViewBodyState extends State<EditViewBody> {
  String? content;

  String? title;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        child: Column(
          children: [
             CustomAppBar(
              text: 'Edit Note',
              icon: Icons.done,
              onTap: () {
                
              },
            ),
            Image.asset(
              'assets/images/Notebook.png',
              height: 250,
            ),
            CustomTextField(
              onSaved: (value) {
                title = value;
              },
              hintText: 'Title',
            ),
            const SizedBox(
              height: 15,
            ),
            const CustomTextField(
              hintText: 'Content',
              maxLines: 5,
            ),
          ],
        ),
      ),
    );
  }
}
