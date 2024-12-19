import 'package:calculator_app/src/features/theme/data/colors.dart';
import 'package:calculator_app/src/shared/shared.dart';
import 'package:flutter/material.dart';

final theme1 = ThemeData(
  useMaterial3: true,
  textTheme: TextTheme().apply(
    fontFamily: LeagueSpartan,
  ),
  scaffoldBackgroundColor: appColors.theme1Background,
  colorScheme: ColorScheme.dark(
    surface: appColors.theme1Background,
    onSurface: appColors.whiteText,
    surfaceContainer: appColors.theme1DisplayBG,
    surfaceContainerHigh: appColors.theme1KeypadBG,
    primary: appColors.theme1KeyBG,
    primaryContainer: appColors.theme1KeyHover,
    secondary: appColors.theme1DelKeyBg,
    secondaryContainer: appColors.theme1DelKeyHover,
    tertiary: appColors.theme1EqualsKeyBG,
    tertiaryContainer: appColors.theme1EqualsKeyHover,
    onPrimary: appColors.theme1ButtonText,
    error: Colors.red,
  ),
);

final theme2 = ThemeData(
  useMaterial3: true,
  textTheme: TextTheme().apply(
    fontFamily: LeagueSpartan,
  ),
  scaffoldBackgroundColor: appColors.theme2Background,
  colorScheme: ColorScheme.light(
    surface: appColors.theme2Background,
    surfaceContainer: appColors.theme2DisplayBG,
    surfaceContainerHigh: appColors.theme2KeypadBG,
    primary: appColors.theme2KeyBG,
    primaryContainer: appColors.theme2KeyHover,
    secondary: appColors.theme2DelKeyBg,
    secondaryContainer: appColors.theme2DelKeyHover,
    tertiary: appColors.theme2EqualsKeyBG,
    tertiaryContainer: appColors.theme2EqualsKeyHover,
    onPrimary: appColors.theme2ButtonText,
    error: Colors.red,
  ),
);

final theme3 = ThemeData(
  useMaterial3: true,
  textTheme: TextTheme().apply(
    fontFamily: LeagueSpartan,
  ),
  scaffoldBackgroundColor: appColors.theme3Background,
  colorScheme: ColorScheme.dark(
    surface: appColors.theme3Background,
    surfaceContainer: appColors.theme3DisplayBackground,
    surfaceContainerHigh: appColors.theme3DisplayBackground,
    primary: appColors.theme3KeyBG,
    primaryContainer: appColors.theme3KeyHover,
    secondary: appColors.theme3DelKeyBg,
    secondaryContainer: appColors.theme3DelKeyHover,
    tertiary: appColors.theme3EqualsKeyBG,
    tertiaryContainer: appColors.theme3EqualsKeyHover,
    onPrimary: appColors.theme3ButtonText,
    error: Colors.red,
  ),
);
