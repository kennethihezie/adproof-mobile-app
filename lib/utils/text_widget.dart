import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

/// Created by collins ihezie on 10/05/23


Widget textWidget({required String text, Color? color, FontWeight? fontWeight, double? fontSize, TextAlign? textAlign}) {
  return Text(text, style: GoogleFonts.dmSans(color: color, fontWeight: fontWeight, fontSize: fontSize), textAlign: textAlign);
}