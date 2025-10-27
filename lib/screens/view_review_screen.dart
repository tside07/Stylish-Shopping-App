import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stylish_shopping_app/utils/routes.dart';
import '../core/theme/app_text_style.dart';
import '../widgets/star_rating.dart';
import '../data/reviews_data.dart';
import '../widgets/custom_app_bar.dart';

class ViewReviewScreen extends StatefulWidget {
  const ViewReviewScreen({super.key});

  @override
  State<ViewReviewScreen> createState() => _ViewReviewScreenState();
}

class _ViewReviewScreenState extends State<ViewReviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        leading: IconButton(
          icon: SvgPicture.asset('assets/icons/app_icons/Arrow_Left.svg'),
          onPressed: () => Navigator.pop(context),
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
        ),
        title: Text(
          'Reviews',
          style: AppTextStyle.s17.copyWith(
            fontWeight: FontWeight.w600,
            color: const Color(0xff1D1E20),
          ),
        ),
      ),
      body: Column(
        children: [Expanded(child: _Body(reviews: reviews))],
      ),
    );
  }
}

class _Body extends StatelessWidget {
  final List<Map<String, dynamic>> reviews;

  const _Body({required this.reviews});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 25),

          // Reviews Summary
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '245 Reviews',
                    style: AppTextStyle.s15.copyWith(
                      color: const Color(0xff1D1E20),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Text(
                        '4.8',
                        style: AppTextStyle.s13.copyWith(
                          color: const Color(0xff1D1E20),
                        ),
                      ),
                      const SizedBox(width: 8),
                      const StarRating(value: 4.8, starSize: 14),
                    ],
                  ),
                ],
              ),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.addReview);
                },
                icon: SvgPicture.asset('assets/icons/app_icons/Edit.svg'),
                label: Text(
                  'Add Review',
                  style: AppTextStyle.s13.copyWith(fontWeight: FontWeight.w500),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffFF7043),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10.5,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  elevation: 0,
                ),
              ),
            ],
          ),

          const SizedBox(height: 30),

          // Reviews List
          ...reviews.map((review) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: _ReviewCard(
                name: review['name'],
                date: review['date'],
                rating: review['rating'],
                comment: review['comment'],
                avatar: review['avatar'],
              ),
            );
          }),
        ],
      ),
    );
  }
}

class _ReviewCard extends StatelessWidget {
  final String name;
  final String date;
  final double rating;
  final String comment;
  final String? avatar;

  const _ReviewCard({
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

              const SizedBox(width: 10),

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
                    const SizedBox(height: 7),
                    Row(
                      children: [
                        const Icon(
                          Icons.access_time,
                          size: 15,
                          color: Color(0xff8F959E),
                        ),
                        const SizedBox(width: 5),
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
                      const SizedBox(width: 5),
                      Text(
                        'rating',
                        style: AppTextStyle.s11.copyWith(
                          color: const Color(0xff8F959E),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(width: 10),

                  // Stars
                  StarRating(value: rating, starSize: 14),
                ],
              ),
            ],
          ),

          const SizedBox(height: 12),

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
