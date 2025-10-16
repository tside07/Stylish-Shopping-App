import 'package:flutter/material.dart';
import '../../../../core/theme/app_text_style.dart';
import '../../../../utils/routes.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.shopping_cart_outlined,
              size: 100,
              color: Color(0xff8F959E),
            ),
            const SizedBox(height: 20),
            Text(
              'Your cart is empty',
              style: AppTextStyle.s17.copyWith(
                fontWeight: FontWeight.w600,
                color: const Color(0xff1D1E20),
              ),
            ),
            const SizedBox(height: 10),
            Text.rich(
              TextSpan(
                text:
                    'Looks like you haven\'t added anything to your cart yet. ',
                style: AppTextStyle.s15.copyWith(
                  color: const Color(0xff8F959E),
                  height: 1.5,
                ),
                children: [
                  WidgetSpan(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.home);
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
            ),
          ],
        ),
      ),
    );
  }
}
