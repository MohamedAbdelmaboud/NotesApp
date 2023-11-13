import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/widgets/custom_app_bar.dart';
import 'package:notes_app/widgets/custom_text.dart';
import 'package:notes_app/widgets/no_notes_body.dart';
import 'package:notes_app/widgets/notes_list_view.dart';

class NotesViewBody extends StatefulWidget {
  const NotesViewBody({super.key});

  @override
  State<NotesViewBody> createState() => _NotesViewBodyState();
}

class _NotesViewBodyState extends State<NotesViewBody> {
  @override
  void initState() {
    BlocProvider.of<NotesCubit>(context).displayNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        child: Column(
          children: [
            const CustomAppBar(
              text: 'Title',
              icon: Icons.search,
            ),
            BlocBuilder<NotesCubit, NotesState>(
              builder: (context, state) {
                if (state is NotesEmpty) {
                  return const NoNotesBody();
                } else if (state is NotesSuccess) {
                  return const NotesListView();
                } else {
                  return const CustomText('something went wrong');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
