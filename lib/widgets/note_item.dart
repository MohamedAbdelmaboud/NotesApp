import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/edit_note_view.dart';
import 'package:notes_app/widgets/custom_text.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({
    super.key,
    required this.noteModel,
  });
  final NoteModel noteModel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, EditNoteView.id,arguments: noteModel);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 22),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Color(noteModel.color),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: CustomText(noteModel.title, fontSize: 20),
              subtitle: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: CustomText(
                  noteModel.content,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.black.withOpacity(0.6),
                ),
              ),
              trailing: IconButton(
                onPressed: () {
                  noteModel.delete();
                  BlocProvider.of<NotesCubit>(context).displayNotes();
                  BlocProvider.of<NotesCubit>(context).isEmpty();
                },
                icon: const FaIcon(
                  FontAwesomeIcons.trash,
                  color: Colors.black,
                ),
              ),
              contentPadding: const EdgeInsets.all(0),
            ),
            CustomText(
              noteModel.date,
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Colors.black.withOpacity(0.6),
            )
          ],
        ),
      ),
    );
  }
}
