import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
              color: Color(0xffF5F6FA),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                SvgPicture.asset(
                  'assets/icons/app_icons/Edit1.svg',
                  width: 15,
                  height: 15,
                ),
                const SizedBox(width: 5),
                Text('Edit', style: AppTextStyle.s15.copyWith()),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
