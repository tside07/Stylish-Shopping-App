import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/theme/app_text_style.dart';
import '../../../data/reviews_data.dart';
import '../../../widgets/custom_app_bar.dart';
import 'package:stylish_shopping_app/modules/product/widgets/view_review_widget.dart';

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
          ReviewSummary(rating: '4.8'),

          const SizedBox(height: 30),

          // Reviews List
          ...reviews.map((review) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: ReviewCard(
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
