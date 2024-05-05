import 'package:flutter/material.dart';

class AppTheme {
  static const String LIGHT = 'light';
  static const String DARK = 'dark';

  static const primaryClr = lightGreyClr;
  static const appBarClr = Color(0xff1a1a1a);
  static const drawerClr = Color(0xffebebeb);
  static const secondaryClr = Color(0xffebebeb);
  static const lightGreyClr = Color(0xff888888);
  static const backgroundClr = Color(0xfff1f1f1);
  static const whiteselClr = Color(0xfffafafa);
  static const oliverGreenClr = Color(0xff5e8e3e);
  static const grasGreenClr = Color(0xff94be46);

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
