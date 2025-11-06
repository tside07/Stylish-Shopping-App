import 'package:flutter/material.dart';
import 'package:stylish_shopping_app/modules/home/screens/home_screen.dart';
import '../../../core/theme/app_text_style.dart';

class Header extends StatelessWidget {
  final String title;
  final String description;

  const Header({super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: AppTextStyle.base.copyWith(
            fontSize: 25,
            fontWeight: FontWeight.w600,
            height: 28 / 25,
            color: const Color(0xff1D1E20),
          ),
        ),

        const SizedBox(height: 10),

        // Description
        Text(
          textAlign: TextAlign.center,
          description,
          maxLines: 2,
          style: AppTextStyle.s15.copyWith(
            fontWeight: FontWeight.w400,
            height: 21 / 15,
            color: const Color(0xff8F959E),
          ),
        ),
      ],
    );
  }
}

class GenderButton extends StatelessWidget {
  const GenderButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen()),
                (route) => false,
              );
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 20.5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 0,
            ),
            child: Text(
              'Women',
              style: AppTextStyle.s17.copyWith(color: const Color(0xff8F959E)),
            ),
          ),
        ),
        const SizedBox(width: 10),

        Expanded(
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen()),
                (route) => false,
              );
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 20.5),
              backgroundColor: const Color(0xff9775FA),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 0,
            ),
            child: Text(
              'Men',
              style: AppTextStyle.s17.copyWith(color: Color(0xffFFFFFF)),
            ),
          ),
        ),
      ],
    );
  }
}

class SkipButton extends StatelessWidget {
  const SkipButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
          (route) => false,
        );
      },
      child: Text(
        'Skip',
        style: AppTextStyle.s17.copyWith(color: const Color(0xff8F959E)),
      ),
    );
  }
}
