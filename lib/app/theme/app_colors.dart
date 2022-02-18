import 'package:flutter/material.dart';

class AppColors {
  static const Color black = Color(0xff10161B);
  static const Color white = Color(0xffFFFFFF);
  static const Color darkGray = Color(0xff202A33);
  static const Color gray = Color(0xff283743);
  static const Color grayLight = Color(0xffE9F1F7);
  static const Color shadow = Color(0xff878264);
  static const Color purple = Color(0xff543661);
  static const Color red = Color(0xffBF2237);
  static const Color green = Color(0xff2CA58D);
  static const Color blue = Color(0xff0171B7);
  static const Color yellow = Color(0xffF1C541);

  static const ColorScheme colorScheme = ColorScheme.dark(
    background: black,
    primary: darkGray,
    secondary: purple,
    surface: gray,
    onBackground: white,
    onPrimary: white,
    onSecondary: white,
    onSurface: white,
  );
}
