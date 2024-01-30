import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class style {
  Color backgroundColor = Colors.grey[800]!;
  Color boxedPressed = Colors.grey[300]!;
  Color borderPressed = Colors.black;
  TextStyle textStyle = TextStyle(
    color: Colors.white,
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
    fontStyle: FontStyle.italic,
  );
  TextStyle gstyle1 = GoogleFonts.caesarDressing(
      textStyle: TextStyle(
    color: Colors.white,
    fontSize: 50.0,
    fontWeight: FontWeight.bold,
    fontStyle: FontStyle.italic,
  ));

  TextStyle gstyle2 = GoogleFonts.maidenOrange(
      textStyle: TextStyle(
        color: Colors.white,
        fontSize: 30.0,
      ));

  TextStyle gstyle2Pressed = GoogleFonts.maidenOrange(
      textStyle: TextStyle(
        color: Colors.black,
        fontSize: 30.0,
      ));

  Color textColor = Colors.white;
}
