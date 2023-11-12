import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/cubits/add_notes_cubit/add_notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/custom_button.dart';
import 'package:notes_app/widgets/custom_text_field.dart';

class AddNoteFrom extends StatefulWidget {
  const AddNoteFrom({super.key});

  @override
  State<AddNoteFrom> createState() => _AddNoteFromState();
}

class _AddNoteFromState extends State<AddNoteFrom> {
  String? title;
  String? content;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  var fromKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: fromKey,
      autovalidateMode: autovalidateMode,
      child: Padding(
        padding: EdgeInsets.only(
            left: 16.0,
            right: 16,
            top: 16,
            bottom: MediaQuery.of(context).viewInsets.bottom),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomTextField(
                hintText: 'Title',
                onSaved: (value) {
                  title = value;
                },
              ),
              const SizedBox(
                height: 30,
              ),
              CustomTextField(
                hintText: 'Content',
                onSaved: (value) {
                  content = value;
                },
                maxLines: 5,
              ),
              const SizedBox(
                height: 30,
              ),
              BlocBuilder<AddNotesCubit, AddNotesState>(
                builder: (context, state) {
                  return CustomButton(
                    onPressed: () {
                      if (fromKey.currentState!.validate()) {
                        fromKey.currentState!.save();
                        var currentDate = DateTime.now();
                        String formattedDate =
                            DateFormat.yMMMEd().format(currentDate);
                        var notemodel = NoteModel(
                            title: title!,
                            content: content!,
                            date: formattedDate,
                            color: Colors.blue.value);
                        BlocProvider.of<AddNotesCubit>(context)
                            .addnotes(notemodel);
                      } else {
                        autovalidateMode = AutovalidateMode.always;
                        setState(() {});
                      }
                    },
                    isLoading: state is AddNotesLoading ? true : false,
                  );
                },
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
