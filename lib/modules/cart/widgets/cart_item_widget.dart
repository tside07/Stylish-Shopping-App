import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stylish_shopping_app/core/constants/resources.dart';
import 'package:stylish_shopping_app/core/extensions/theme_extension.dart';
import 'package:stylish_shopping_app/core/theme/app_text_style.dart';
import 'package:stylish_shopping_app/core/widgets/app_gap.dart';
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
        color: context.cardColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Row(
          children: [
            // Product Image
            _ProductImage(item: item),
            AppGap.w15,

            // Product Info
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          _ProductName(item: item),
                          AppGap.h10,
                          _ProductPrice(item: item),
                        ],
                      ),
                    ),

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
            _QuantityButton(icon: IconPath.arrowDown, onTap: onDecrement),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                '${item.quantity}',
                style: AppTextStyle.s13.copyWith(
                  fontWeight: FontWeight.w600,
                  color: context.primaryTextColor,
                ),
              ),
            ),
            _QuantityButton(icon: IconPath.arrowUp, onTap: onIncrement),
          ],
        ),

        // Delete Button
        _QuantityButton(onTap: onRemove, icon: IconPath.delete),
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
        color: context.primaryTextColor,
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
