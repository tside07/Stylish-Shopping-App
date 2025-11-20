import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:provider/provider.dart';
import 'package:stylish_shopping_app/core/constants/resources.dart';
import 'package:stylish_shopping_app/core/theme/theme_provider.dart';

class StarRating extends StatelessWidget {
  final double value;
  final int starCount;
  final double starSize;
  final Color starColor;
  final Color? starOffColor;
  final bool showValue;
  final TextStyle? valueTextStyle;
  final Function(double)? onValueChanged;

  const StarRating({
    super.key,
    required this.value,
    this.starCount = 5,
    this.starSize = 13,
    this.starColor = const Color(0xffFF981F),
    this.starOffColor,
    this.showValue = false,
    this.valueTextStyle,
    this.onValueChanged,
  });

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDark = themeProvider.isDarkMode;


    return RatingStars(
      value: value,
      onValueChanged: onValueChanged ?? (v) {},
      starCount: starCount,
      starSize: starSize,
      starColor: starColor,
      starOffColor: isDark ? const Color(0xff1B262C) : const Color(0xffFEFEFE),
      valueLabelVisibility: showValue,
      maxValueVisibility: false,
      starSpacing: 2,
      animationDuration: const Duration(milliseconds: 300),
      starBuilder: (index, color) {
        bool isFilled = color == starColor;

        return SvgPicture.asset(
          isFilled
              ? IconPath.starFilled
              : IconPath.star,
          width: starSize,
          height: starSize,
        );
      }
    );
  }
}
