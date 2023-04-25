import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const bugluayColor = Color.fromRGBO(62, 39, 123, 1);

ThemeData get theme {
  final theme = ThemeData(
    scaffoldBackgroundColor: bugluayColor,
    useMaterial3: true,
  );
  return theme.copyWith(
    textTheme: GoogleFonts.kanitTextTheme(theme.textTheme),
    primaryTextTheme: GoogleFonts.kanitTextTheme(theme.primaryTextTheme),
  );
}
