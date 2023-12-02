import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:notes_app/cubits/add_notes_cubit/add_notes_cubit.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/details_view.dart';
import 'package:notes_app/views/edit_note_view.dart';
import 'package:notes_app/widgets/custom_text.dart';
import 'package:notes_app/widgets/show_snack_bar.dart';

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
        Navigator.pushNamed(context, DetailsView.id, arguments: noteModel);
      },
      child: Slidable(
        key: UniqueKey(),
        startActionPane: ActionPane(
          motion: const ScrollMotion(),
          dismissible: DismissiblePane(onDismissed: () {
            onDismissed(context);
          }),
          children: [
            SlidableAction(
              onPressed: (context) {
                onDismissed(context);
              },
              backgroundColor: const Color(0xFFFE4A49),
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
            ),
          ],
        ),
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
                    Navigator.pushNamed(context, EditNoteView.id,
                        arguments: noteModel);
                  },
                  icon: const Icon(
                    Icons.edit_document,
                    color: Colors.black,
                    size: 35,
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
      ),
    );
  }

  void onDismissed(BuildContext context) {
    noteModel.delete();
    showSnackBar(context, 'Note deleted !', true);
    BlocProvider.of<NotesCubit>(context).displayNotes();
    BlocProvider.of<NotesCubit>(context).isEmpty();
  }
}
