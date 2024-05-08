import 'package:converse/src/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final baseTheme = ThemeData.light();
const outlineInputBorderBase =
    UnderlineInputBorder(borderSide: BorderSide.none);

ThemeData lightTheme = ThemeData(
  textTheme: GoogleFonts.latoTextTheme().copyWith(
    headlineMedium: TextStyle(
      fontSize: 25.sp,
      fontWeight: FontWeight.w700,
    ),
    displayMedium: TextStyle(
      fontSize: 18.sp,
    ),
  ),
  useMaterial3: true,
  inputDecorationTheme: baseTheme.inputDecorationTheme.copyWith(
    contentPadding: EdgeInsets.zero,
    floatingLabelBehavior: FloatingLabelBehavior.auto,
    border: outlineInputBorderBase,
    focusedBorder: outlineInputBorderBase,
    enabledBorder: outlineInputBorderBase,
    errorStyle:
        TextStyle(height: 0, fontWeight: FontWeight.normal, fontSize: 15.sp),
    labelStyle: TextStyle(
        color: appColors.inputFieldTextColor,
        fontSize: 14,
        fontWeight: FontWeight.w400),
    hintStyle: TextStyle(
        color: appColors.inputFieldTextColor,
        fontSize: 16.sp,
        fontWeight: FontWeight.w400),
  ),
  colorScheme: ColorScheme.light(
    onPrimary: appColors.blue.withOpacity(0.6),
    primary: appColors.blue,
    secondary: appColors.grey.withOpacity(0.3),
    error: appColors.error,
    onError: appColors.error.withOpacity(0.42),
    background: appColors.white,
  ).copyWith(background: appColors.scaffoldColor),
);

ThemeData darkTheme = ThemeData(
  textTheme: GoogleFonts.latoTextTheme().copyWith(
    headlineMedium: TextStyle(
      fontSize: 25.sp,
      fontWeight: FontWeight.w700,
    ),
    displayMedium: TextStyle(
      fontSize: 18.sp,
    ),
  ),
  useMaterial3: true,
  inputDecorationTheme: baseTheme.inputDecorationTheme.copyWith(
    contentPadding: EdgeInsets.zero,
    floatingLabelBehavior: FloatingLabelBehavior.auto,
    border: outlineInputBorderBase,
    focusedBorder: outlineInputBorderBase,
    enabledBorder: outlineInputBorderBase,
    errorStyle:
        TextStyle(height: 0, fontWeight: FontWeight.normal, fontSize: 15.sp),
    labelStyle: TextStyle(
        color: appColors.inputFieldTextColor,
        fontSize: 14,
        fontWeight: FontWeight.w400),
    hintStyle: TextStyle(
        color: appColors.inputFieldTextColor,
        fontSize: 16.sp,
        fontWeight: FontWeight.w400),
  ),
  colorScheme: ColorScheme.dark(
    onPrimary: appColors.blue.withOpacity(0.6),
    primary: appColors.blue,
    secondary: appColors.grey.withOpacity(0.3),
    error: appColors.error,
    onError: appColors.error.withOpacity(0.42),
    background: appColors.white,
  ).copyWith(background: appColors.scaffoldColor),
);

var appColors = AppColors();
