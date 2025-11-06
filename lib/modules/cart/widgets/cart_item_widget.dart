import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stylish_shopping_app/core/theme/app_text_style.dart';
import 'package:stylish_shopping_app/models/cart_item_model.dart';

class CartItemWidget extends StatelessWidget {
  final CartItem item;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  final VoidCallback onRemove;

  const CartItemWidget({
    super.key,
    required this.item,
    required this.onIncrement,
    required this.onDecrement,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 120,
      decoration: BoxDecoration(
        color: Color(0xffFEFEFE),
        border: Border.all(color: const Color(0xffF5F6FA)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            // Product Image
            _ProductImage(item: item),
            const SizedBox(width: 15),

            // Product Info
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _ProductName(item: item),
                    const SizedBox(height: 10),
                    _ProductPrice(item: item),

                    const SizedBox(height: 10),

                    // Quantity Controls
                    _QuantityControl(
                      item: item,
                      onIncrement: onIncrement,
                      onDecrement: onDecrement,
                      onRemove: onRemove,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _QuantityButton extends StatelessWidget {
  final String icon;
  final VoidCallback onTap;

  const _QuantityButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 25,
        height: 25,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: const Color(0xffDEDEDE)),
        ),
        child: Center(child: SvgPicture.asset(icon)),
      ),
    );
  }
}

class _QuantityControl extends StatelessWidget {
  final CartItem item;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  final VoidCallback onRemove;

  const _QuantityControl({
    required this.item,
    required this.onIncrement,
    required this.onDecrement,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            _QuantityButton(
              icon: 'assets/icons/app_icons/Arrow_Down.svg',
              onTap: onDecrement,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                '${item.quantity}',
                style: AppTextStyle.s13.copyWith(
                  fontWeight: FontWeight.w600,
                  color: const Color(0xff1D1E20),
                ),
              ),
            ),
            _QuantityButton(
              icon: 'assets/icons/app_icons/Arrow_Up.svg',
              onTap: onIncrement,
            ),
          ],
        ),

        // Delete Button
        _QuantityButton(
          onTap: onRemove,
          icon: 'assets/icons/app_icons/Delete.svg',
        ),
      ],
    );
  }
}

class _ProductPrice extends StatelessWidget {
  final CartItem item;

  const _ProductPrice({required this.item});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          item.price,
          style: AppTextStyle.s11.copyWith(
            fontWeight: FontWeight.w400,
            color: const Color(0xff8F959E),
          ),
        ),
        Text(
          item.taxPrice,
          style: AppTextStyle.s11.copyWith(
            fontWeight: FontWeight.w400,
            color: const Color(0xff8F959E),
          ),
        ),
      ],
    );
  }
}

class _ProductName extends StatelessWidget {
  final CartItem item;

  const _ProductName({required this.item});

  @override
  Widget build(BuildContext context) {
    return Text(
      item.productName,
      style: AppTextStyle.s13.copyWith(
        fontWeight: FontWeight.w500,
        color: const Color(0xff1D1E20),
      ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }
}

class _ProductImage extends StatelessWidget {
  final CartItem item;

  const _ProductImage({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: const Color(0xffF5F6FA),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Image.asset(item.productImage, fit: BoxFit.contain),
    );
  }
}
