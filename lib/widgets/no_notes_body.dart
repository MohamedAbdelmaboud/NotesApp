import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_text.dart';

class NoNotesBody extends StatelessWidget {
  const NoNotesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'assets/images/notes.png',
          height: 400,
        ),
        const CustomText(
          'Add your first note ✨',
          color: Colors.black,
        ).jetBrainsMono(),
      ],
    );
  }
}
