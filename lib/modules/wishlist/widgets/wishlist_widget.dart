import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stylish_shopping_app/core/constants/resources.dart';
import 'package:stylish_shopping_app/core/extensions/theme_extension.dart';
import 'package:stylish_shopping_app/core/widgets/app_gap.dart';
import '../../../core/theme/app_text_style.dart';

class EditButton extends StatelessWidget {
  const EditButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            //Navigate to edit wishlist
          },
          child: Container(
            padding: const EdgeInsets.all(11),
            decoration: BoxDecoration(
              color: context.backgroundAppBarIconColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                SvgPicture.asset(
                  IconPath.edit1,
                  colorFilter: ColorFilter.mode(
                    context.primaryTextColor,
                    BlendMode.srcIn,
                  ),
                  width: 15,
                  height: 15,
                ),
                AppGap.w5,
                Text('Edit', style: AppTextStyle.s15.copyWith(color: context.primaryTextColor)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
