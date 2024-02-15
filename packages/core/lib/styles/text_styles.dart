// coverage:ignore-file
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// text style
final TextStyle kHeading5 =
    GoogleFonts.poppins(fontSize: 23, fontWeight: FontWeight.w400);
final TextStyle kHeading7 = GoogleFonts.poppins(
    fontSize: 19, fontWeight: FontWeight.w500, letterSpacing: 0.15, color: Colors.white);
final TextStyle kHeading6 = GoogleFonts.poppins(
    fontSize: 19, fontWeight: FontWeight.w500, letterSpacing: 0.15, color: Colors.black);
final TextStyle kSubtitle = GoogleFonts.poppins(
    fontSize: 15, fontWeight: FontWeight.w400, letterSpacing: 0.15, color: Colors.black);
final TextStyle kBodyText = GoogleFonts.poppins(
    fontSize: 13, fontWeight: FontWeight.w400, letterSpacing: 0.25, color: Colors.black);

// text theme
final kTextTheme = TextTheme(
  headlineSmall: kHeading5, //headline5
  titleLarge: kHeading6, //headline6
  titleMedium: kSubtitle, //subtitle1
  bodyMedium: kBodyText, //bodyText2
);
