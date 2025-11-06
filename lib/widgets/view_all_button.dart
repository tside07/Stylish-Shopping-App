import 'package:flutter/material.dart';
import '../../../core/theme/app_text_style.dart';

class ViewAllButton extends StatelessWidget {
  final String header;
  final String button;
  final VoidCallback onTap;

  const ViewAllButton({super.key, required this.header, required this.button, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          header,
          style: AppTextStyle.s17.copyWith(
            fontWeight: FontWeight.w600,
            color: const Color(0xff1D1E20),
          ),
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            button,
            style: AppTextStyle.s13.copyWith(color: const Color(0xff8F959E)),
          ),
        ),
      ],
    );
  }
}

class HomeViewAll extends StatelessWidget {
  final String header;
  final String button;
  final VoidCallback onTap;

  const HomeViewAll({super.key, required this.header, required this.button, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          header,
          style: AppTextStyle.s17.copyWith(
            color: const Color(0xff1D1E20),
          ),
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            button,
            style: AppTextStyle.s13.copyWith(color: const Color(0xff8F959E)),
          ),
        ),
      ],
    );
  }
}