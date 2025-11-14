import 'package:flutter/material.dart';

extension ThemeContext on BuildContext {
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;

  Color get backgroundColor => Theme.of(this).scaffoldBackgroundColor;

  Color get primaryTextColor => Theme.of(this).colorScheme.onSurface;

  Color get surfaceColor => Theme.of(this).colorScheme.surface;
}
