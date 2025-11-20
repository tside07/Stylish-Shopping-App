import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:stylish_shopping_app/core/constants/resources.dart';
import 'package:stylish_shopping_app/core/theme/app_text_style.dart';
import 'package:stylish_shopping_app/core/theme/theme_provider.dart';
import 'package:stylish_shopping_app/core/widgets/app_gap.dart';
import 'package:stylish_shopping_app/utils/routes.dart';

class CardItem extends StatelessWidget {
  final String card;

  const CardItem({super.key, required this.card});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 185,
      width: 300,
      child: Image.asset(card, fit: BoxFit.contain),
    );
  }
}

class AddCard extends StatelessWidget {
  const AddCard({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDark = themeProvider.isDarkMode;

    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: () {
          Navigator.pushNamed(context, AppRoutes.addCard);
        },
        style: OutlinedButton.styleFrom(
          backgroundColor: isDark ? Color(0xff2F244E) : Color(0xffF6F2FF),
          side: const BorderSide(color: Color(0xff9775FA), width: 1.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 0,
          padding: const EdgeInsets.symmetric(vertical: 15.5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              IconPath.plus,
              colorFilter: const ColorFilter.mode(
                Color(0xff9775FA),
                BlendMode.srcIn,
              ),
            ),
            AppGap.w5,
            Text(
              'Add new card',
              style: AppTextStyle.s17.copyWith(
                color: const Color(0xff9775FA),
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
