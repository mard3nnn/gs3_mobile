import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTypography extends StatelessWidget {
  const AppTypography({
    super.key,
    required this.title,
    this.color,
    this.fontWeight,
    this.fontSize,
    this.textAlign,
  });

  final String title;
  final Color? color;
  final FontWeight? fontWeight;
  final double? fontSize;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign,
      style: GoogleFonts.manrope(
        color: color,
        fontWeight: fontWeight,
        fontSize: fontSize,
      ),
    );
  }
}
