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
    surfaceContainer: appColors.theme1DisplayBackground,
    surfaceContainerHigh: appColors.theme1KeypadBackground,
    primary: appColors.lightGrayishOrangeKeyBackground,
    onPrimary: appColors.veryDarkGrayishBlueText,
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
    surfaceContainer: appColors.theme2DisplayBackground,
    surfaceContainerHigh: appColors.theme2KeypadBackground,
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
  ),
);
