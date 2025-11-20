import 'package:flutter/material.dart';
import 'package:stylish_shopping_app/core/extensions/theme_extension.dart';
import 'package:stylish_shopping_app/core/theme/app_text_style.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:stylish_shopping_app/core/widgets/app_gap.dart';

class RatingField extends StatelessWidget {
  final double starValue;
  final ValueChanged<double> onStarChanged;

  const RatingField({
    super.key,
    required this.starValue,
    required this.onStarChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RatingBar.builder(
          initialRating: starValue,
          minRating: 0,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemSize: 20,
          itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
          itemBuilder: (context, color) =>
              const Icon(Icons.star, color: Color(0xffFFC833)),
          unratedColor: context.secondaryTextColor,
          onRatingUpdate: onStarChanged,
          updateOnDrag: true,
          glow: false,
        ),
        AppGap.w15,

        Text(
          starValue.toStringAsFixed(1),
          style: AppTextStyle.s17.copyWith(
            color: context.primaryTextColor,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
