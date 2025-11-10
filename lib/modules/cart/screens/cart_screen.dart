import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stylish_shopping_app/utils/routes.dart';
import '../../../core/theme/app_text_style.dart';
import '../../../models/cart_item_model.dart';
import '../widgets/empty_cart.dart';
import '../widgets/cart_item_widget.dart';
import '../widgets/cart_summary.dart'; // Widget mới
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
        backgroundColor: Colors.white,
        appBar: CustomAppBar(
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: SvgPicture.asset('assets/icons/app_icons/Arrow_Left.svg'),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
          title: Text(
            'Cart',
            style: AppTextStyle.s17.copyWith(
              fontWeight: FontWeight.w600,
              color: const Color(0xff1D1E20),
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

    return Stack(
      children: [
        // Cart Items List (scrollable)
        Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
            top: 20,
            bottom: 300, // Space for draggable sheet
          ),
          child: ListView.builder(
            itemCount: cartItems.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: CartItemWidget(
                  item: cartItems[index],
                  onIncrement: () => _incrementQuantity(index),
                  onDecrement: () => _decrementQuantity(index),
                  onRemove: () => _removeItem(index),
                ),
              );
            },
          ),
        ),

        CartSummary(
          subtotal: subtotal,
          deliveryCharge: deliveryCharge,
          total: total,
          onCheckout: () {
            Navigator.pushNamed(context, AppRoutes.orderSuccess);
          },
        ),
      ],
    );
  }
}
