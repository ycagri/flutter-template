import 'package:flutter/material.dart';

final appTheme = ThemeData(
  colorScheme: const ColorScheme.light(),
  appBarTheme: const AppBarTheme(),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(),
  useMaterial3: true,
  chipTheme: const ChipThemeData(
    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
  ),
  cardTheme: const CardThemeData(
    color: Colors.white,
    surfaceTintColor: Colors.white,
    elevation: 4,
  ),
  scaffoldBackgroundColor: Colors.white,
  iconButtonTheme: IconButtonThemeData(
    style: IconButton.styleFrom(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
    ),
  ),
  filledButtonTheme: FilledButtonThemeData(
    style: FilledButton.styleFrom(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
    ),
  ),
  sliderTheme: const SliderThemeData(),
  textTheme: const TextTheme(),
);
