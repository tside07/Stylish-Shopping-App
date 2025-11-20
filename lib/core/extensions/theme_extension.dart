import 'package:flutter/material.dart';

extension ThemeContext on BuildContext {
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;

  Color get backgroundColor => Theme.of(this).scaffoldBackgroundColor; //trang -> den nhat
  Color get primaryTextColor => Theme.of(this).colorScheme.onSurface; //den -> trang
  Color get surfaceColor => Theme.of(this).colorScheme.surface;
  Color get primaryButtonColor => Theme.of(this).colorScheme.primary;
  Color get secondaryColor => Theme.of(this).colorScheme.secondary;

  // Color get appbarColor =>
  //     Theme.of(this).appBarTheme.backgroundColor ??
  //     (isDarkMode ? const Color(0xff1B262C) : const Color(0xffFEFEFE));

  Color get secondaryTextColor {
    return isDarkMode ? const Color(0xffA0A0A0) : const Color(0xff8F959E);
  }
  Color get containerButtonTextColor {
    return isDarkMode ? const Color(0xff29363D) : const Color(0xffF1F1F1);
  }

  Color get inputFieldFillColor {
    return isDarkMode ? const Color(0xff222E34) : const Color(0xffF5F6FA);
  }

  Color get backgroundAppBarIconColor {
    return isDarkMode ? const Color(0xff222E34) : const Color(0xffF5F6FA);
  }

  Color get buttonColor {
    return isDarkMode ? const Color(0xff222E34) : const Color(0xffF5F6FA);
  }

  Color get navbarColor {
    return isDarkMode ? const Color(0xff29363D) : const Color(0xffF5F6FA);
  }

  Color get resendConfirmationCodeColor {
    return isDarkMode ? const Color(0xffFFFFFF) : const Color(0xff1D1E20);
  }

  Color get genderSelectionBackgroundColor {
    return isDarkMode ? const Color(0xff1B262C) : const Color(0xff9775FA);
  }

  Color get resetValueButtonColor {
    return isDarkMode ? const Color(0xff455A64) : const Color(0xff00FFEA);
  }

  Color get primaryColor => Theme.of(this).primaryColor;

  /// Card/Container background
  Color get cardColor {
    return isDarkMode
        ? const Color(0xff222E34) // Dark: xám đậm
        : const Color(0xffFEFEFE); // Light: trắng
  }
  Color get containerColor {
    return isDarkMode
        ? const Color(0xff222E34) // Dark: xám đậm
        : const Color(0xffF5F5F5); // Light: trắng
  }

  /// Border color
  Color get borderColor {
    return isDarkMode
        ? const Color(0xff3A3A3A) // Dark: xám
        : const Color(0xffF5F6FA); // Light: xám nhạt
  }

  /// Divider color
  Color get dividerColor {
    return isDarkMode
        ? Colors.white.withValues(alpha: 0.1)
        : const Color(0xffDEDEDE);
  }

  /// Icon color
  Color get iconColor => primaryTextColor;

  // Hint text color
  Color get hintColor {
    return isDarkMode ? const Color(0xff808080) : const Color(0xff8F959E);
  }

  // Shadow color
  Color get shadowColor {
    return isDarkMode
        ? Colors.black.withValues(alpha: 0.3)
        : Colors.black.withValues(alpha: 0.05);
  }

  /// Success color (green)
  Color get successColor => const Color(0xff4AC76D);

  /// Error color (red)
  Color get errorColor => const Color(0xffFF4747);

  /// Warning color (orange)
  Color get warningColor => const Color(0xffFFA500);
}
