import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/note_model.dart';

part 'add_notes_state.dart';

class AddNotesCubit extends Cubit<AddNotesState> {
  AddNotesCubit() : super(AddNotesInitial());
  addnotes(NoteModel note) async {
    emit(AddNotesLoading());
    try {
      var notes = Hive.box<NoteModel>(notesBox);
      await notes.add(note);
      emit(AddNotesSuccess());
    } catch (e) {
      emit(AddNotesFailure(errorMassage: e.toString()));
    }
  }
}

//Generics
class Temp<T> {
  final T value;
  Temp({required this.value});
}
