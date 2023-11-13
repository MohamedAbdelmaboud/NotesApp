import 'package:hive/hive.dart';

part 'note_model.g.dart';

@HiveType(typeId: 0) //uniqe across the whole local data base
class NoteModel extends HiveObject {
  //Field numbers can be in the range 0-255.
  @HiveField(0)
   String title;
  @HiveField(1)
   String content;
  @HiveField(2)
  final String date; // can't be changed
  @HiveField(3)
   int color;

  NoteModel(
      {required this.title,
      required this.content,
      required this.date,
      required this.color});
}
