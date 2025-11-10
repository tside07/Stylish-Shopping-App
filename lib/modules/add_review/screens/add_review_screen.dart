import 'package:flutter/material.dart';
import 'package:stylish_shopping_app/core/theme/app_text_style.dart';
import 'package:stylish_shopping_app/core/widgets/app_gap.dart';
import 'package:stylish_shopping_app/widgets/custom_text_field.dart';
import 'package:stylish_shopping_app/widgets/form_label.dart';
import 'package:stylish_shopping_app/widgets/primary_button.dart';
import '../../../widgets/custom_app_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stylish_shopping_app/modules/add_review/widgets/add_review_widget.dart';

class AddReviewScreen extends StatefulWidget {
  const AddReviewScreen({super.key});

  @override
  State<AddReviewScreen> createState() => _AddReviewScreenState();
}

class _AddReviewScreenState extends State<AddReviewScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  double _starValue = 0.0;

  @override
  void dispose() {
    _nameController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBar(
          leading: IconButton(
            icon: SvgPicture.asset('assets/icons/app_icons/Arrow_Left.svg'),
            onPressed: () => Navigator.pop(context),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
          title: Text(
            'Add Review',
            style: AppTextStyle.s17.copyWith(
              fontWeight: FontWeight.w600,
              color: const Color(0xff1D1E20),
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: _Body(
                nameController: _nameController,
                contentController: _contentController,
                starValue: _starValue,
                onStarChanged: (value) {
                  setState(() {
                    _starValue = value;
                  });
                },
              ),
            ),

            SizedBox(
              child: PrimaryButton(
                text: 'Submit Review',
                color: const Color(0xff9775FA),
                onClick: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController contentController;
  final double starValue;
  final ValueChanged<double> onStarChanged;

  const _Body({
    required this.nameController,
    required this.contentController,
    required this.starValue,
    required this.onStarChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppGap.h25,

            // Name
            const FormLabel(text: 'Name'),
            AppGap.h10,
            CustomTextField(
              controller: nameController,
              hintText: 'Type your name',
            ),

            AppGap.h20,

            // Experience
            const FormLabel(text: 'How was your experience ?'),
            AppGap.h10,
            CustomTextField(
              controller: contentController,
              hintText: 'Describe your experience?',
              maxLines: 5,
            ),

            AppGap.h30,

            // Star Rating
            const FormLabel(text: 'Star'),
            AppGap.h15,

            // Star Rating with value display
            RatingField(starValue: starValue, onStarChanged: onStarChanged),

            AppGap.h30,
          ],
        ),
      ),
    );
  }
}
