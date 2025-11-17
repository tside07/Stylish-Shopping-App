import 'package:flutter/material.dart';
import 'package:stylish_shopping_app/core/extensions/theme_extension.dart';
import 'package:stylish_shopping_app/core/theme/app_text_style.dart';

class CustomTitle extends StatelessWidget {
  final String text;
  const CustomTitle({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppTextStyle.base.copyWith(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: context.primaryTextColor,
      ),
    );
  }
}
