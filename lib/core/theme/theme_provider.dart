import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }

  ThemeData get currentTheme {
    return _isDarkMode ? _darkTheme : _lightTheme;
  }

  // Light Theme
  static final ThemeData _lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: const Color(0xffFEFEFE),
    primaryColor: const Color(0xff9775FA),
    fontFamily: 'FiraSans',
    colorScheme: const ColorScheme.light(
      primary: Color(0xffFEFEFE),
      surface: Color(0xffFFFFFF),
      onSurface: Color(0xff1D1E20),

      
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Color(0xff1D1E20), fontFamily: 'FiraSans'),
      bodyMedium: TextStyle(color: Color(0xff8F959E), fontFamily: 'FiraSans'),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      hintStyle: TextStyle(
        fontFamily: 'Inter',
        color: Color(0xff1D1E20),
        fontSize: 15,
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xffFFFFFF),
      foregroundColor: Color(0xff1D1E20),
    ),
  );

  // Dark Theme
  static final ThemeData _darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xff1B262C),
    primaryColor: const Color(0xff9775FA),
    fontFamily: 'FiraSans',
    colorScheme: const ColorScheme.dark(
      primary: Color(0xff000000),
      surface: Color(0xff1B262C),
      onSurface: Color(0xffFFFFFF),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Color(0xffFFFFFF), fontFamily: 'FiraSans'),
      bodyMedium: TextStyle(color: Color(0xffA0A0A0), fontFamily: 'FiraSans'),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      hintStyle: TextStyle(
        fontFamily: 'Inter',
        color: Color(0xffFFFFFF),
        fontSize: 15,
      ),
    ),  
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xff1B262C),
      foregroundColor: Color(0xffFFFFFF),
    ),
  );
}
