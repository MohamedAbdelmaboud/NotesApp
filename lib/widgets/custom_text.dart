import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  const CustomText(this.text,
      {super.key,
      this.color = Colors.black,
      this.fontWeight = FontWeight.w500,
      this.fontSize = 20,
      this.maxLines = 2,
      this.textAlign});
  final Color color;
  final double fontSize;
  final String text;
  final FontWeight fontWeight;
  final int maxLines;
  final TextAlign? textAlign;
  Text jetBrainsMono() {
    return Text(
      text,
      style: GoogleFonts.jetBrainsMono(
          fontSize: fontSize, color: color, fontWeight: fontWeight),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.poppins(
          fontSize: fontSize, color: color, fontWeight: fontWeight),
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
    );
  }
}
