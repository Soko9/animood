import 'package:animood/src/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData get light => ThemeData.light().copyWith(
    scaffoldBackgroundColor: AppColors.background,
    textTheme: GoogleFonts.outfitTextTheme(),
    colorScheme: const ColorScheme.light(
      primary: AppColors.primary,
      onSurface: AppColors.text,
    ),
  );
}
