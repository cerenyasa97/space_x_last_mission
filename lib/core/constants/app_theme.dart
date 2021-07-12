import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spacex_last_mission/core/constants/constants.dart';

ThemeData appTheme = ThemeData(
  primaryColor: AppConstants.DARK_BLUE,
  primaryColorDark: AppConstants.LIGHT_BLACK,
  textTheme: TextTheme(
    headline1: GoogleFonts.slabo27px(
      color: Colors.white,
      fontSize: 48,
      fontWeight: FontWeight.bold
    ),
    headline2: GoogleFonts.slabo27px(
      color: Colors.white,
      fontSize: 24,
      fontWeight: FontWeight.w600
    ),
    headline3: GoogleFonts.slabo27px(
      color: Colors.white,
      fontSize: 20
    )
  )
);