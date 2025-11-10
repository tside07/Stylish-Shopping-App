import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stylish_shopping_app/core/constants/resources.dart';
import 'package:stylish_shopping_app/core/widgets/app_gap.dart';
import 'package:stylish_shopping_app/widgets/primary_button.dart';
import '../../../core/theme/app_text_style.dart';
import '../../../utils/routes.dart';

class CartSummary extends StatelessWidget {
  final double subtotal;
  final double deliveryCharge;
  final double total;
  final VoidCallback onCheckout;

  const CartSummary({
    super.key,
    required this.subtotal,
    required this.deliveryCharge,
    required this.total,
    required this.onCheckout,
  });

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.45,
      minChildSize: 0.45,
      maxChildSize: 0.65,
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, -5),
              ),
            ],
          ),
          child: Column(
            children: [
              // Drag Handle
              Container(
                margin: const EdgeInsets.only(top: 10),
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: const Color(0xffDEDEDE),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),

              // Scrollable Content
              Expanded(
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        AppGap.h20,

                        // Delivery Address
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, AppRoutes.address);
                          },
                          child: const _DeliveryAddressSection(),
                        ),

                        AppGap.h20,

                        // Payment Method
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, AppRoutes.payment);
                          },
                          child: const _PaymentMethodSection(),
                        ),

                        AppGap.h20,

                        // Order Info
                        _OrderInfoSection(
                          subtotal: subtotal,
                          deliveryCharge: deliveryCharge,
                          total: total,
                        ),

                        AppGap.h24,
                      ],
                    ),
                  ),
                ),
              ),

              // Checkout Button
              SizedBox(
                child: PrimaryButton(
                  onClick: onCheckout,
                  color: const Color(0xff9775FA),
                  text: 'Checkout',
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _DeliveryAddressSection extends StatelessWidget {
  const _DeliveryAddressSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Delivery Address',
              style: AppTextStyle.s17.copyWith(color: const Color(0xff1D1E20)),
            ),
            const Icon(Icons.keyboard_arrow_right, size: 15),
          ],
        ),
        AppGap.h10,
        Row(
          children: [
            SizedBox(
              width: 50,
              height: 50,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(Images.map),
                  ),
                  Center(
                    child: SvgPicture.asset(
                      IconPath.location,
                    ),
                  ),
                ],
              ),
            ),
            AppGap.w15,
            Expanded(
              child: Text(
                '43, Electronics City Phase 1, Electronic City',
                style: AppTextStyle.s15.copyWith(
                  fontWeight: FontWeight.w400,
                  color: const Color(0xff8F959E),
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            AppGap.w10,
            Container(
              width: 25,
              height: 25,
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color(0xff4AC76D),
              ),
              child: SvgPicture.asset(
                IconPath.check1,
                height: 6.875,
                width: 10,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _PaymentMethodSection extends StatelessWidget {
  const _PaymentMethodSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Payment Method',
              style: AppTextStyle.s17.copyWith(color: const Color(0xff1D1E20)),
            ),
            const Icon(Icons.keyboard_arrow_right, size: 15),
          ],
        ),
        AppGap.h15,
        Row(
          children: [
            SizedBox(
              width: 50,
              height: 50,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(Images.whiteBackground),
                  ),
                  Center(
                    child: SvgPicture.asset(IconPath.visa),
                  ),
                ],
              ),
            ),
            AppGap.w15,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Visa Classic',
                    style: AppTextStyle.s15.copyWith(
                      fontWeight: FontWeight.w400,
                      color: const Color(0xff1D1E20),
                    ),
                  ),
                  AppGap.h5,
                  Text(
                    '**** 7690',
                    style: AppTextStyle.s13.copyWith(
                      color: const Color(0xff8F959E),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 25,
              height: 25,
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color(0xff4AC76D),
              ),
              child: SvgPicture.asset(
                IconPath.check1,
                height: 6.875,
                width: 10,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _OrderInfoSection extends StatelessWidget {
  final double subtotal;
  final double deliveryCharge;
  final double total;

  const _OrderInfoSection({
    required this.subtotal,
    required this.deliveryCharge,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Order Info',
              style: AppTextStyle.s17.copyWith(color: const Color(0xff1D1E20)),
            ),
          ],
        ),
        AppGap.h15,
        _PriceRow(label: 'Subtotal', value: '\$${subtotal.toStringAsFixed(0)}'),
        AppGap.h10,
        _PriceRow(
          label: 'Delivery Charge',
          value: '\$${deliveryCharge.toStringAsFixed(0)}',
        ),
        AppGap.h15,
        _PriceRow(
          label: 'Total',
          value: '\$${total.toStringAsFixed(0)}',
          isTotal: true,
        ),
      ],
    );
  }
}

class _PriceRow extends StatelessWidget {
  final String label;
  final String value;
  final bool isTotal;

  const _PriceRow({
    required this.label,
    required this.value,
    this.isTotal = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: AppTextStyle.s15.copyWith(
            color: const Color(0xff8F959E),
            fontWeight: isTotal ? FontWeight.w600 : FontWeight.w400,
          ),
        ),
        Text(
          value,
          style: AppTextStyle.s15.copyWith(
            color: const Color(0xff1D1E20),
            fontWeight: isTotal ? FontWeight.w600 : FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
