import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stylish_shopping_app/core/constants/resources.dart';
import 'package:stylish_shopping_app/core/widgets/app_gap.dart';
import 'package:stylish_shopping_app/utils/routes.dart';
import '../../../core/theme/app_text_style.dart';
import '../../../widgets/star_rating.dart';
import '../../../data/reviews_data.dart';

class ReviewCard extends StatelessWidget {
  final String name;
  final String date;
  final double rating;
  final String comment;
  final String? avatar;

  const ReviewCard({
    super.key,
    required this.name,
    required this.date,
    required this.rating,
    required this.comment,
    this.avatar,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xffF5F6FA), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              // Avatar
              CircleAvatar(
                radius: 20,
                backgroundColor: const Color(0xffE0E0E0),
                backgroundImage: avatar != null ? AssetImage(avatar!) : null,
                child: avatar == null
                    ? Text(
                        name.substring(0, 1).toUpperCase(),
                        style: AppTextStyle.s15.copyWith(
                          fontWeight: FontWeight.w600,
                          color: const Color(0xff1D1E20),
                        ),
                      )
                    : null,
              ),

              AppGap.w10,

              // Name and Date
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: AppTextStyle.s15.copyWith(
                        fontWeight: FontWeight.w600,
                        color: const Color(0xff1D1E20),
                      ),
                    ),
                    AppGap.h7,
                    Row(
                      children: [
                        const Icon(
                          Icons.access_time,
                          size: 15,
                          color: Color(0xff8F959E),
                        ),
                        AppGap.w5,
                        Text(
                          date,
                          style: AppTextStyle.s11.copyWith(
                            color: const Color(0xff8F959E),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Rating
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Text(
                        rating.toString(),
                        style: AppTextStyle.s15.copyWith(
                          color: const Color(0xff1D1E20),
                        ),
                      ),
                      AppGap.w5,
                      Text(
                        'rating',
                        style: AppTextStyle.s11.copyWith(
                          color: const Color(0xff8F959E),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),

                  AppGap.w10,

                  // Stars
                  StarRating(value: rating, starSize: 13),
                ],
              ),
            ],
          ),

          AppGap.h12,

          // Comment
          Text(
            comment,
            style: AppTextStyle.s15.copyWith(
              color: const Color(0xff8F959E),
              fontWeight: FontWeight.w400,
            ),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

class ReviewSummary extends StatelessWidget {
  final String rating;

  const ReviewSummary({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${reviews.length} Reviews',
              style: AppTextStyle.s15.copyWith(color: const Color(0xff1D1E20)),
            ),
            AppGap.h5,
            Row(
              children: [
                Text(
                  rating,
                  style: AppTextStyle.s13.copyWith(
                    color: const Color(0xff1D1E20),
                  ),
                ),
                AppGap.w8,
                const StarRating(value: 4.8, starSize: 14),
              ],
            ),
          ],
        ),
        ElevatedButton.icon(
          onPressed: () {
            Navigator.pushNamed(context, AppRoutes.addReview);
          },
          icon: SvgPicture.asset(IconPath.edit),
          label: Text(
            'Add Review',
            style: AppTextStyle.s13.copyWith(fontWeight: FontWeight.w500),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xffFF7043),
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10.5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            elevation: 0,
          ),
        ),
      ],
    );
  }
}
