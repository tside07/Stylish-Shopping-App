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
                        _SectionTitle(
                          text: 'Delivery Address',
                          icon: Icons.keyboard_arrow_right,
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            _ImageField(
                              image: 'assets/images/map.png',
                              icon: 'assets/icons/app_icons/Location.svg',
                            ),
                            const SizedBox(width: 15),

                            Expanded(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: _AddressSection(
                                      text:
                                          '43, Electronics City Phase 1, Electronic City',
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  _CheckIcon(
                                    icon: 'assets/icons/app_icons/Check1.svg',
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
                    Navigator.pushNamed(context, AppRoutes.payment);
                  },
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      children: [
                        _SectionTitle(
                          text: 'Payment Method',
                          icon: Icons.keyboard_arrow_right,
                        ),

                        const SizedBox(height: 15),
                        Row(
                          children: [
                            _ImageField(
                              image: 'assets/images/white_background.png',
                              icon: 'assets/icons/app_icons/Visa.svg',
                            ),
                            const SizedBox(width: 15),
                            Expanded(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: _PaymentSection(
                                      text: 'Visa Classic',
                                      serialNo: '**** 7690',
                                    ),
                                  ),
                                  _CheckIcon(
                                    icon: 'assets/icons/app_icons/Check1.svg',
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

                // Orderinfo
                Column(
                  children: [
                    _SectionTitle(text: 'Order Info'),
                    const SizedBox(height: 15),
                    _OrderInfo(
                      subtotal: subtotal,
                      deliveryCharge: deliveryCharge,
                      total: total,
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),
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
          style: AppTextStyle.s15.copyWith(color: const Color(0xff8F959E)),
        ),
        Text(
          value,
          style: AppTextStyle.s15.copyWith(color: const Color(0xff1D1E20)),
        ),
      ],
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String text;
  final IconData? icon;

  const _SectionTitle({required this.text, this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: AppTextStyle.s17.copyWith(color: const Color(0xff1D1E20)),
        ),
        Icon(icon, size: 15),
      ],
    );
  }
}

class _ImageField extends StatelessWidget {
  final String image;
  final String icon;

  const _ImageField({required this.image, required this.icon});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 50,
      child: Stack(
        alignment: Alignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(image),
          ),
          Center(child: SvgPicture.asset(icon)),
        ],
      ),
    );
  }
}

class _CheckIcon extends StatelessWidget {
  final String icon;

  const _CheckIcon({required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 25,
      height: 25,
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Color(0xff4AC76D),
      ),
      child: SvgPicture.asset(icon, height: 6.875, width: 10),
    );
  }
}

class _PaymentSection extends StatelessWidget {
  final String text;
  final String serialNo;

  const _PaymentSection({required this.text, required this.serialNo});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: AppTextStyle.s15.copyWith(
            fontWeight: FontWeight.w400,
            color: const Color(0xff1D1E20),
          ),
        ),
        const SizedBox(height: 5),
        Text(
          serialNo,
          style: AppTextStyle.s13.copyWith(color: const Color(0xff8F959E)),
        ),
      ],
    );
  }
}

class _AddressSection extends StatelessWidget {
  final String text;

  const _AddressSection({required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40,
      child: Text(
        text,
        style: AppTextStyle.s15.copyWith(
          fontWeight: FontWeight.w400,
          color: const Color(0xff8F959E),
        ),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
