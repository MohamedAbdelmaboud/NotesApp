import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/note_item.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<NoteModel> notesModels =
        BlocProvider.of<NotesCubit>(context).notesModels;
    return Expanded(
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemCount: notesModels.length,
        separatorBuilder: (BuildContext context, int index) {
          return const Padding(padding: EdgeInsets.symmetric(vertical: 8));
        },
        itemBuilder: (BuildContext context, int index) {
          return  NoteItem(noteModel: notesModels[index],);
        },
      ),
    );
  }
}
