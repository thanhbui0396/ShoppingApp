import 'package:flutter/material.dart';

class ThemeCustom {
  static ThemeData lightTheme = ThemeData.light().copyWith(
    primaryColor: main_light,
    colorScheme:
        const ColorScheme.light().copyWith(background: colorContainerLight),
  );
  static ThemeData darkTheme = ThemeData.dark().copyWith(
    primaryColor: main_dark,
    colorScheme:
        const ColorScheme.light().copyWith(background: colorContainerDark),
  );
}

//colors
const Color main_light = Color(0xFF027335);
const Color main_dark = Colors.amber;
const Color colorContainerLight = Colors.white;
const Color colorContainerDark = Colors.black;


//themestyle
