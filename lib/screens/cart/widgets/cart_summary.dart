// File: lib/screens/cart/widgets/cart_summary.dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/theme/app_text_style.dart';
import '../../../widgets/primary_button.dart';
import 'package:stylish_shopping_app/utils/routes.dart';

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
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                // delivery
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutes.address);
                  },
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Delivery Address',
                              style: AppTextStyle.s17.copyWith(
                                color: const Color(0xff1D1E20),
                              ),
                            ),
                            const Icon(Icons.keyboard_arrow_right, size: 15),
                          ],
                        ),
                        const SizedBox(height: 10),
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
                                    child: Image.asset('assets/images/map.png'),
                                  ),
                                  Center(
                                    child: SvgPicture.asset(
                                      'assets/icons/app_icons/Location.svg',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 15),
                            Expanded(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: SizedBox(
                                      width: 40,
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
                                  ),
                                  const SizedBox(width: 10),
                                  const Icon(
                                    Icons.check_circle,
                                    color: Color(0xff4AC76D),
                                    size: 25,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // payment
                GestureDetector(
                  onTap: () {
                    // TODO: Navigate to payment method selection
                  },
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Payment Method',
                              style: AppTextStyle.s17.copyWith(
                                color: const Color(0xff1D1E20),
                              ),
                            ),
                            const Icon(Icons.keyboard_arrow_right, size: 15),
                          ],
                        ),
                        const SizedBox(height: 15),
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
                                    child: Image.asset(
                                      'assets/images/white_background.png',
                                    ),
                                  ),
                                  Center(
                                    child: SvgPicture.asset(
                                      'assets/icons/app_icons/Visa.svg',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 15),
                            Expanded(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Visa Classic',
                                          style: AppTextStyle.s15.copyWith(
                                            fontWeight: FontWeight.w400,
                                            color: const Color(0xff1D1E20),
                                          ),
                                        ),
                                        const SizedBox(height: 5),
                                        Text(
                                          '**** 7690',
                                          style: AppTextStyle.s13.copyWith(
                                            color: const Color(0xff8F959E),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Icon(
                                    Icons.check_circle,
                                    color: Color(0xff4AC76D),
                                    size: 25,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                //Orderinfo
                _OrderInfo(
                  subtotal: subtotal,
                  deliveryCharge: deliveryCharge,
                  total: total,
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),
          SizedBox(
            child: PrimaryButton(
              text: 'Checkout',
              color: const Color(0xff9775FA),
              onClick: onCheckout,
            ),
          ),
        ],
      ),
    );
  }
}

class _OrderInfo extends StatelessWidget {
  final double subtotal;
  final double deliveryCharge;
  final double total;

  const _OrderInfo({
    required this.subtotal,
    required this.deliveryCharge,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _PriceRow(label: 'Subtotal', value: '\$${subtotal.toStringAsFixed(0)}'),
        const SizedBox(height: 10),
        _PriceRow(
          label: 'Delivery Charge',
          value: '\$${deliveryCharge.toStringAsFixed(0)}',
        ),
        const SizedBox(height: 15),
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
          style: isTotal
              ? AppTextStyle.s17.copyWith(
                  fontWeight: FontWeight.w600,
                  color: const Color(0xff1D1E20),
                )
              : AppTextStyle.s15.copyWith(color: const Color(0xff8F959E)),
        ),
        Text(
          value,
          style: isTotal
              ? AppTextStyle.s17.copyWith(
                  fontWeight: FontWeight.w600,
                  color: const Color(0xff1D1E20),
                )
              : AppTextStyle.s15.copyWith(
                  fontWeight: FontWeight.w600,
                  color: const Color(0xff1D1E20),
                ),
        ),
      ],
    );
  }
}
