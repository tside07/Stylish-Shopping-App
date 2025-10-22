import 'package:flutter/material.dart';
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
            color: color ?? const Color(0xff1D1E20),
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
