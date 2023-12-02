import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes_app/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      this.maxLines = 1,
      required this.hintText,
      this.onSaved,
      this.onChanged, this.inputFormatters});
  final void Function(String?)? onSaved;
  final void Function(String)? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final int maxLines;
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: inputFormatters,
      onChanged: onChanged,
      onSaved: onSaved,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'This field is required';
        }
        return null;
      },
      style: GoogleFonts.poppins(fontSize: 16, color: Colors.black),
      maxLines: maxLines,
      cursorColor: primaryColor,
      decoration: InputDecoration(
        hintStyle: GoogleFonts.montserrat(
            fontSize: 16, color: primaryColor, fontStyle: FontStyle.italic),
        hintText: hintText,
        border: buildBorder(),
        focusedBorder: buildBorder(color: Colors.black),
        enabledBorder: buildBorder(),
      ),
    );
  }
}

OutlineInputBorder buildBorder({color}) {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: color ?? Colors.black));
}
