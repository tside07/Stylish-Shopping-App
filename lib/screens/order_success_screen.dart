import 'package:flutter/material.dart';
import 'package:stylish_shopping_app/core/theme/app_text_style.dart';
import 'package:stylish_shopping_app/utils/routes.dart';
import 'package:stylish_shopping_app/widgets/primary_button.dart';
import '../widgets/custom_app_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OrderSuccessScreen extends StatefulWidget {
  const OrderSuccessScreen({super.key});

  @override
  State<OrderSuccessScreen> createState() => _OrderSuccessScreenState();
}

class _OrderSuccessScreenState extends State<OrderSuccessScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBar(
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: SvgPicture.asset('assets/icons/app_icons/Arrow_Left.svg'),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
        ),
        body: Column(
          children: [
            Expanded(child: _Body()),

            // Go to Orders Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Navigate to Order screen
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xffF5F5F5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 0,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.5),
                    child: Text(
                      'Go to Orders',
                      style: AppTextStyle.s17.copyWith(
                        color: const Color(0xff8F959E),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),

            // Continue Shopping Button
            SizedBox(
              child: PrimaryButton(
                text: 'Continue Shopping',
                color: const Color(0xff9775FA),
                onClick: () {
                  Navigator.pushNamed(context, AppRoutes.home);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                // Container(
                //   width: double.infinity,
                //   height: 300,
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(20),
                //   ),
                //   child: Image.asset('assets/images/mask_group.png'),
                // ),

                // Positioned(
                //   child: Image.asset(
                //     'assets/images/phone.png',
                //     width: 279,
                //     height: 232,
                //     fit: BoxFit.contain,
                //   ),
                // ),

                Image.asset('assets/images/mask_group.png'),
                Image.asset(
                  'assets/images/phone.png',
                  fit: BoxFit.contain,
                ),
              ],
            ),

            const SizedBox(height: 20),

            Text(
              'Order Confirmed!',
              style: AppTextStyle.base.copyWith(
                fontSize: 28,
                fontWeight: FontWeight.w600,
                color: const Color(0xff1D1E20),
              ),
            ),

            const SizedBox(height: 10),

            // Description
            Text(
              'Your order has been confirmed, we will send you confirmation email shortly.',
              maxLines: 2,
              textAlign: TextAlign.center,
              style: AppTextStyle.s15.copyWith(
                color: const Color(0xff8F959E),
                fontWeight: FontWeight.w400,
                height: 20 / 15,
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
