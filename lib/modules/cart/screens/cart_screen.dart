import 'package:flutter/material.dart';
import 'package:stylish_shopping_app/core/constants/resources.dart';
import 'package:stylish_shopping_app/core/extensions/theme_extension.dart';
import 'package:stylish_shopping_app/core/widgets/app_gap.dart';
import 'package:stylish_shopping_app/utils/routes.dart';
import '../../../core/theme/app_text_style.dart';
import '../../../models/cart_item_model.dart';
import '../widgets/empty_cart.dart';
import '../widgets/cart_item_widget.dart';
import '../widgets/cart_bottom_section.dart';
import '../../../widgets/custom_app_bar.dart';

class CartScreen extends StatefulWidget {
  final bool isInHub;

  const CartScreen({super.key, this.isInHub = false});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  void _incrementQuantity(int index) {
    setState(() {
      cartItems[index].quantity++;
    });
  }

  void _decrementQuantity(int index) {
    setState(() {
      if (cartItems[index].quantity > 1) {
        cartItems[index].quantity--;
      }
    });
  }

  void _removeItem(int index) {
    setState(() {
      cartItems.removeAt(index);
    });
  }

  double _calculateSubtotal() {
    double subtotal = 0;
    for (var item in cartItems) {
      double price = double.tryParse(item.price.replaceAll('\$', '')) ?? 0;
      subtotal += price * item.quantity;
    }
    return subtotal;
  }

  @override
  Widget build(BuildContext context) {
    final subtotal = _calculateSubtotal();
    final deliveryCharge = 10.0;
    final total = subtotal + deliveryCharge;

    if (widget.isInHub) {
      return _buildBody(subtotal, deliveryCharge, total);
    }

    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: context.backgroundColor,
        appBar: CustomAppBar(
          leading: AppBarIconButton(
            onPressed: () => Navigator.pop(context),
            svgPath: IconPath.arrowLeft,
          ),
          title: Text(
            'Cart',
            style: AppTextStyle.s17.copyWith(
              fontWeight: FontWeight.w600,
              color: context.primaryTextColor,
            ),
          ),
        ),
        body: _buildBody(subtotal, deliveryCharge, total),
      ),
    );
  }

  Widget _buildBody(double subtotal, double deliveryCharge, double total) {
    if (cartItems.isEmpty) {
      return const EmptyCart();
    }

    return SingleChildScrollView(
      child: Column(
        children: [
          AppGap.h20,

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: cartItems.asMap().entries.map((entry) {
                int index = entry.key;
                CartItem item = entry.value;

                return Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: CartItemWidget(
                    item: item,
                    onIncrement: () => _incrementQuantity(index),
                    onDecrement: () => _decrementQuantity(index),
                    onRemove: () => _removeItem(index),
                  ),
                );
              }).toList(),
            ),
          ),

          CartBottomSection(
            subtotal: subtotal,
            deliveryCharge: deliveryCharge,
            total: total,
            onCheckout: () {
              Navigator.pushNamed(context, AppRoutes.orderSuccess);
            },
          ),
        ],
      ),
    );
  }
}
