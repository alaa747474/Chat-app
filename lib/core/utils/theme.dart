import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  static ThemeData theme() {
    return ThemeData(
      disabledColor: Color.fromARGB(255, 70, 70, 70),
      primaryColorLight: Colors.white,
      focusColor: const Color.fromARGB(255, 57, 125, 227),
      hintColor: const Color.fromARGB(255, 104, 104, 104),
      primaryColor: const Color.fromARGB(255, 28, 28, 28),
      scaffoldBackgroundColor: Colors.black,
      shadowColor: Colors.black,
      textTheme: textTheme(),
    );
  }

  static TextTheme textTheme() {
    return TextTheme(
      headline1: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 25.sp,
      ),
      headline2: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 20.sp,
      ),
      headline3: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w600,
        fontSize: 18.sp,
      ),
      headline4: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w600,
        fontSize: 16.sp,
      ),
      headline5: TextStyle(
        color: const Color.fromARGB(255, 104, 104, 104),
        fontSize: 16.sp,
      ),
      bodyText1: TextStyle(
        color: const Color.fromARGB(255, 57, 125, 227),
        fontWeight: FontWeight.normal,
        fontSize: 16.sp,
      ),
      bodyText2: TextStyle(
        color: const Color.fromARGB(255, 255, 255, 255),
        fontWeight: FontWeight.normal,
        fontSize: 16.sp,
      ),
    );
  }
}
