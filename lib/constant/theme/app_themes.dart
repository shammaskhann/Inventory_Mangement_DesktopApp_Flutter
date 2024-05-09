import 'dart:typed_data';

import 'package:flutter/material.dart';

class AppTheme {
  static const String LIGHT = 'light';
  static const String DARK = 'dark';

  static const primaryClr = lightGreyClr;
  static const appBarClr = Color(0xff1a1a1a);
  static const drawerClr = Color(0xffebebeb);
  static const secondaryClr = Color(0xff282828);
  static const lightGreyClr = Color(0xff888888);
  static const backgroundClr = Color(0xfff1f1f1);
  static const whiteselClr = Color(0xfffafafa);
  //static const oliverGreenClr = Color(0xff5e8e3e);
  static const oliverGreenClr = Color(0xff04B4FC);
  static const grasGreenClr = Color(0xff04B4FC);
  // static const grasGreenClr = Color(0xff94be46);
  static const darkThemeBackgroudClr = appBarClr;
  static const sideTabBarClr = Color(0xffebebeb);
  static const selectedIconClr = Colors.black;
  // static const selectedIconClr = Color(0xff4a4a4a);
  static const unselectedIconClr = Color.fromARGB(255, 255, 255, 255);
  static const blackClr = Color(0xff000000);
  static Gradient shimmerEffectTile = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      const Color(0xff282828),
      Colors.grey[500]!,
      const Color(0xff282828)
    ],
    stops: const [0.1, 0.3, 0.4], // 10%, 30%, 40%
  );

  static ThemeData lightTheme = ThemeData(
    //fontFamily: 'Inter',
    primaryColor: primaryClr,
    scaffoldBackgroundColor: whiteselClr,
    appBarTheme: const AppBarTheme(
      backgroundColor: appBarClr,
      iconTheme: IconThemeData(color: secondaryClr),
      titleTextStyle: TextStyle(color: Colors.white),
    ),
    colorScheme: const ColorScheme.light(
      primary: primaryClr,
      secondary: secondaryClr,
      error: Colors.red,
    ),
    iconTheme: const IconThemeData(color: secondaryClr),
  );
}
