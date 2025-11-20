import 'package:flutter/material.dart';
import 'package:stylish_shopping_app/core/extensions/theme_extension.dart';
import '../core/theme/app_text_style.dart';

class FormLabel extends StatelessWidget {
  final String text;
  final Color? color;

  const FormLabel({super.key, required this.text, this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text,
          style: AppTextStyle.s17.copyWith(
            color: color ?? context.primaryTextColor,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
