import 'package:flutter/material.dart';
import 'package:stylish_shopping_app/core/extensions/theme_extension.dart';
import 'package:stylish_shopping_app/core/widgets/app_gap.dart';
import '../../../../core/theme/app_text_style.dart';
import '../../../../utils/routes.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: _Notif(
          icon: Icons.shopping_cart_outlined,
          content: "Your cart is empty",
        ),
      ),
    );
  }
}

class _EmptyText extends StatelessWidget {
  const _EmptyText();

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: 'Looks like you haven\'t added anything to your cart yet. ',
        style: AppTextStyle.s15.copyWith(
          color: const Color(0xff8F959E),
          height: 1.5,
        ),
        children: [
          WidgetSpan(
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.hub);
              },
              child: Text(
                'Start shopping',
                style: AppTextStyle.s15.copyWith(
                  color: const Color(0xff9775FA),
                  fontWeight: FontWeight.w600,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ),
          const TextSpan(text: ' now!'),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}

class _Notif extends StatelessWidget {
  final IconData? icon;
  final String content;

  const _Notif({required this.icon, required this.content});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 100, color: Color(0xff8F959E)),
        AppGap.h20,
        Text(
          content,
          style: AppTextStyle.s17.copyWith(
            fontWeight: FontWeight.w600,
            color: context.primaryTextColor,
          ),
        ),
        AppGap.h10,
        _EmptyText(),
      ],
    );
  }
}
