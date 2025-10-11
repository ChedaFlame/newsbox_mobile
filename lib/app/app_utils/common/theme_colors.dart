import 'package:flutter/material.dart';

class ThemeColors {
  static const Color transparent = Colors.transparent;
  static const Color primaryColor = Color(0xff13337f);


  static const Color white = Colors.white;
  static const Color blue = Colors.blue;
  static const Color black = Colors.black;
  static const Color green = Color(0xff1a854b);
  static const Color red = Colors.red;
  static const Color textColor = Colors.black;
  static const Color greyColor = Colors.grey;
  static const Color warningColor = Colors.orange;
  static const Color warning = Colors.yellowAccent;
  static const Color caution = Color(0xFFE28C3B);


  static const int _helpPrimaryValue = 0xFFE2B93B;
  static const MaterialColor help = MaterialColor(
    _helpPrimaryValue,
    <int, Color>{
      50: Color(0xFFFCF8EB),
      100: Color(0xFFE1CC92),
      200: Color(0xFFE0C780),
      300: Color(0xFFD2B154),
      400: Color(0xFFE2B93B),
      500: Color(_helpPrimaryValue),
      600: Color(0xFFD9A828),
      700: Color(0xFFDEAA11),
      // 800: Color(0xFFC62828),
      // 900: Color(0xFFB71C1C),
    },
  );

  static const int _successPrimaryValue = 0xFFE2B93B;
  static const MaterialColor success = MaterialColor(
    _successPrimaryValue,
    <int, Color>{
      50: Color(0xFFE8F5E9),
      100: Color(0xFFC8E6C9),
      200: Color(0xFFA5D6A7),
      300: Color(0xFF81C784),
      400: Color(0xFF66BB6A),
      500: Color(_successPrimaryValue),
      600: Color(0xFF43A047),
      700: Color(0xFF388E3C),
      800: Color(0xFF2E7D32),
      900: Color(0xFF1B5E20),
    },
  );

  static const MaterialColor information = MaterialColor(
    _bluePrimaryValue,
    <int, Color>{
      50: Color(0xFFE3F2FD),
      100: Color(0xFFBBDEFB),
      200: Color(0xFF90CAF9),
      300: Color(0xFF64B5F6),
      400: Color(0xFF42A5F5),
      500: Color(_bluePrimaryValue),
      600: Color(0xFF1E88E5),
      700: Color(0xFF1976D2),
      800: Color(0xFF1565C0),
      900: Color(0xFF0D47A1),
    },
  );
  static const int _bluePrimaryValue = 0xFF2196F3;

}
