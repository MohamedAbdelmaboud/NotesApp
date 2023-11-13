import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
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
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              CustomAppBar(
                text: 'Edit Note',
                icon: Icons.done,
                onTap: () {
                  widget.noteModel.title = title ?? widget.noteModel.title;
                  widget.noteModel.content =
                      content ?? widget.noteModel.content;
                  widget.noteModel.save();
                  BlocProvider.of<NotesCubit>(context).displayNotes();
                  Navigator.pop(context);
                },
              ),
              Image.asset(
                'assets/images/Notebook.png',
                height: 250,
              ),
              CustomTextField(
                onChanged: (value) {
                  title = value;
                },
                hintText: widget.noteModel.title,
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextField(
                onChanged: (value) {
                  content = value;
                },
                hintText: widget.noteModel.content,
                maxLines: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
