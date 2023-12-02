import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/simple_boc_observer.dart';
import 'package:notes_app/views/details_view.dart';
import 'package:notes_app/views/edit_note_view.dart';
import 'package:notes_app/views/notes_view.dart';
import 'package:notes_app/views/profile.dart';
import 'package:notes_app/views/test.dart';

void main() async {
  Bloc.observer = MyBlocObserver();

  await Hive.initFlutter();

  Hive.registerAdapter<NoteModel>(NoteModelAdapter());
  await Hive.openBox<NoteModel>(notesBox);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesCubit(),
      child: MaterialApp(
        initialRoute: Profile.id,
        routes: {
          NotesView.id: (context) => const NotesView(),
          EditNoteView.id: (context) => const EditNoteView(),
          DetailsView.id: (context) => const DetailsView(),
          Test.id: (context) => const Test(),
          Profile.id: (context) => const Profile()
        },
        debugShowCheckedModeBanner: false,
        theme: ThemeData(brightness: Brightness.light),
      ),
    );
  }
}
