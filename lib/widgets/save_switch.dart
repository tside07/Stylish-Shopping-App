import 'package:flutter/material.dart';
import 'package:stylish_shopping_app/core/extensions/theme_extension.dart';
import 'package:stylish_shopping_app/core/theme/app_text_style.dart';

class SaveSwitch extends StatelessWidget {
  final String text;
  final bool save;
  final ValueChanged<bool> onSaveChanged;

  const SaveSwitch({
    super.key,
    required this.text,
    required this.save,
    required this.onSaveChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: AppTextStyle.s15.copyWith(color: context.primaryTextColor),
        ),
        Switch(
          value: save,
          activeThumbColor: const Color(0xff34C759),
          onChanged: onSaveChanged,
        ),
      ],
    );
  }
}
