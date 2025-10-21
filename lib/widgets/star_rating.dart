import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';

class StarRating extends StatelessWidget {
  final double value;
  final int starCount;
  final double starSize;
  final Color starColor;
  final Color starOffColor;
  final bool showValue;
  final TextStyle? valueTextStyle;
  final Function(double)? onValueChanged;

  const StarRating({
    Key? key,
    required this.value,
    this.starCount = 5,
    this.starSize = 13,
    this.starColor = const Color(0xffFF981F),
    this.starOffColor = const Color(0xff8F959E),
    this.showValue = false,
    this.valueTextStyle,
    this.onValueChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RatingStars(
      value: value,
      onValueChanged: onValueChanged ?? (v) {},
      starCount: starCount,
      starSize: starSize,
      starColor: starColor,
      starOffColor: starOffColor,
      valueLabelVisibility: showValue,
      maxValueVisibility: false,
      starSpacing: 2,
      animationDuration: const Duration(milliseconds: 300),
    );
  }
}
