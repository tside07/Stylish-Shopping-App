import 'package:flutter/material.dart';
import 'package:stylish_shopping_app/core/constants/resources.dart';
import 'package:stylish_shopping_app/core/extensions/theme_extension.dart';
import 'package:stylish_shopping_app/core/theme/app_text_style.dart';
import 'package:stylish_shopping_app/core/widgets/app_gap.dart';
import 'package:stylish_shopping_app/utils/routes.dart';
import 'package:stylish_shopping_app/widgets/primary_button.dart';
import '../widgets/custom_app_bar.dart';

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
        backgroundColor: context.backgroundColor,
        appBar: CustomAppBar(
          leading: AppBarIconButton(
            onPressed: () => Navigator.pop(context),
            svgPath: IconPath.arrowLeft,
          ),
        ),
        body: Column(
          children: [
            Expanded(child: _Body()),

            AppGap.h30,

            // Go to Orders Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                width: double.infinity,
                child: InkWell(
                  onTap: () {
                    // Navigate to Order screen
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: context.containerColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15.5),
                      child: Text(
                        'Go to Orders',
                        textAlign: TextAlign.center,
                        style: AppTextStyle.s17.copyWith(
                          color: Color(0xff8F959E),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            AppGap.h30,

            // Continue Shopping Button
            SizedBox(
              child: PrimaryButton(
                text: 'Continue Shopping',
                color: const Color(0xff9775FA),
                onClick: () {
                  Navigator.pushNamed(context, AppRoutes.homepage);
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
          children: [
            AppGap.h70,
            SizedBox(
              width: double.infinity,
              height: 510,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  OverflowBox(
                    alignment: Alignment(0, -1),
                    maxWidth: 620,
                    maxHeight: 620,
                    child: Image.asset(
                      ImagePath.maskGr,
                      // color: Color(0xff1D1E20),
                    ),
                  ),

                  Container(
                    alignment: Alignment(0, -0.53),
                    child: Image.asset(ImagePath.phone, height: 250, width: 300),
                  ),

                  Align(
                    alignment: Alignment(0, 0.45),
                    child: Text(
                      'Order Confirmed!',
                      style: AppTextStyle.base.copyWith(
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                        color: context.primaryTextColor,
                      ),
                    ),
                  ),

                  // Description
                  Align(
                    alignment: Alignment(0, 0.65),
                    child: Text(
                      'Your order has been confirmed, we will send you confirmation email shortly.',
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: AppTextStyle.s15.copyWith(
                        color: const Color(0xff8F959E),
                        fontWeight: FontWeight.w400,
                        height: 20 / 15,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
