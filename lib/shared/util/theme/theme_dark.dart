import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

var darkTheme = ThemeData.dark().copyWith(
  primaryColor: Colors.orange[700],
  appBarTheme: AppBarTheme(
    elevation: 0.4,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedItemColor: Colors.orange[700],
  ),
  textTheme: GoogleFonts.robotoTextTheme().copyWith(
      // headline1: TextStyle(
      //   color: Colors.grey[800],
      // ),
      // headline2: TextStyle(
      //   color: Colors.grey[800],
      // ),
      // bodyText1: TextStyle(
      //   color: Colors.grey[800],
      // ),
      // bodyText2: TextStyle(
      //   color: Colors.grey[800],
      // ),
      ),
);
