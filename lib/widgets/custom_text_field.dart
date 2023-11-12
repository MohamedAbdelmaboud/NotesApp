import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes_app/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      this.maxLines = 1,
      required this.hintText,
       this.onSaved});
  final void Function(String?)? onSaved;
  final int maxLines;
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'This field is required';
        }
        return null;
      },
      style: GoogleFonts.poppins(fontSize: 16, color: Colors.white),
      maxLines: maxLines,
      cursorColor: primaryColor,
      decoration: InputDecoration(
        hintStyle: GoogleFonts.pacifico(
            fontSize: 16, color: primaryColor, fontStyle: FontStyle.italic),
        hintText: hintText,
        border: buildBorder(),
        focusedBorder: buildBorder(color: primaryColor),
        enabledBorder: buildBorder(),
      ),
    );
  }
}

OutlineInputBorder buildBorder({color}) {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: color ?? Colors.white));
}
