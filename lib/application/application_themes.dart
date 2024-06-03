import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class ApplicationThemes {
  static TextStyle interStyleTitle = const TextStyle(
      color: Colors.white,
      fontSize: 22,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w700);

  static TextStyle interStyleSubTitle = const TextStyle(
      color: Colors.white,
      fontSize: 15,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w700);

  static TextStyle interStyle = const TextStyle(
      color: Colors.white,
      fontSize: 13,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w700);

  static TextStyle quickSandBold = GoogleFonts.quicksand(
      color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold);

  static TextStyle quickSandRegular = GoogleFonts.quicksand(
      color: Colors.black, fontSize: 16, fontWeight: FontWeight.w400);

  static TextStyle quickSandMedium = GoogleFonts.quicksand(
      color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500);

  static TextStyle quickSandSemiBold = GoogleFonts.quicksand(
      color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600);
}
