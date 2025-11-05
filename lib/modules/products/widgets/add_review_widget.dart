import 'package:flutter/material.dart';
import 'package:stylish_shopping_app/core/theme/app_text_style.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

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
          unratedColor: const Color(0xffE7E8EA),
          onRatingUpdate: onStarChanged,
          updateOnDrag: true,
          glow: false,
        ),
        const SizedBox(width: 15),

        Text(
          starValue.toStringAsFixed(1),
          style: AppTextStyle.s17.copyWith(
            color: const Color(0xff1D1E20),
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
