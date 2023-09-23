import 'package:flutter/material.dart';

class ThemeCustom {
  static ThemeData lightTheme = ThemeData.light().copyWith(
    primaryColor: main_light,
    colorScheme:
        const ColorScheme.light().copyWith(background: colorContainerLight),
    textTheme: const TextTheme(
      headlineMedium: headLoginLight,
      headlineSmall: textNameAppLight,
      bodyLarge: textBodyLoginLight,
      bodySmall: textBodySmallLight,
      titleSmall: textTitleSmallLight,
      titleLarge: textTitleLargelLight,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      hintStyle: TextStyle(
        color: Color(0xFF7D8FAB),
      ),
    ),
  );
  static ThemeData darkTheme = ThemeData.dark().copyWith(
    primaryColor: main_dark,
    colorScheme:
        const ColorScheme.light().copyWith(background: colorContainerDark),
    textTheme: const TextTheme(
      headlineMedium: headLoginDark,
      headlineSmall: textNameAppDark,
      bodyLarge: textBodyLoginDark,
      bodySmall: textBodySmallLight,
      titleSmall: textTitleSmallDark,
      titleLarge: textTitleLargelDark,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      hintStyle: TextStyle(
        color: Color(0xFF7D8FAB),
      ),
    ),
  );
}

//colors
const Color main_light = Color(0xFF027335);
const Color main_dark = Colors.amber;
const Color colorContainerLight = Colors.white;
const Color colorContainerDark = Colors.black;

//themestyle Light
const TextStyle headLoginLight = TextStyle(
  fontSize: 24,
  fontWeight: FontWeight.w700,
  color: Colors.black,
);
const TextStyle textNameAppLight = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w400,
  color: Colors.white,
);
const TextStyle textBodyLoginLight = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w400,
  color: Color(0xFF7D8FAB),
);
const TextStyle textBodySmallLight = TextStyle(
  fontSize: 16,
  color: Colors.black,
  fontWeight: FontWeight.w600,
);
const TextStyle textTitleSmallLight = TextStyle(
  fontSize: 14,
  color: Colors.black,
  fontWeight: FontWeight.w400,
);
const TextStyle textTitleLargelLight = TextStyle(
  fontSize: 24,
  color: Colors.black,
  fontWeight: FontWeight.w700,
);

//themestyle Dark
const TextStyle headLoginDark = TextStyle(
  fontSize: 24,
  fontWeight: FontWeight.w700,
  color: Colors.white,
);
const TextStyle textNameAppDark = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w400,
  color: Colors.black,
);
const TextStyle textBodyLoginDark = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w400,
  color: Color(0xFF7D8FAB),
);
const TextStyle textBodySmallDark = TextStyle(
  fontSize: 16,
  color: Colors.white,
  fontWeight: FontWeight.w600,
);
const TextStyle textTitleSmallDark = TextStyle(
  fontSize: 14,
  color: Colors.white,
  fontWeight: FontWeight.w400,
);
const TextStyle textTitleLargelDark = TextStyle(
  fontSize: 24,
  color: Colors.white,
  fontWeight: FontWeight.w700,
);
