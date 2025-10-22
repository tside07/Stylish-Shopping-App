import 'package:flutter/material.dart';
import '../core/theme/app_text_style.dart';
import '../core/theme/app_input_decoration.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType keyboardType;
  final bool obscureText;
  final Widget? suffixIcon;
  final int maxLines;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.suffixIcon,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xffF5F6FA),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        maxLines: maxLines,
        style: AppTextStyle.s15.copyWith(
          fontWeight: FontWeight.w400,
          color: const Color(0xff1D1E20),
        ),
        decoration: AppInputDecoration.outline.copyWith(
          hintText: hintText,
          hintStyle: AppTextStyle.s15.copyWith(
            fontWeight: FontWeight.w400,
            color: const Color(0xff8F959E),
          ),
          suffixIcon: suffixIcon,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 16.5,
          ),
        ),
      ),
    );
  }
}
