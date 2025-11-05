import 'package:flutter/material.dart';
import 'package:stylish_shopping_app/utils/routes.dart';
import '../../../core/theme/app_text_style.dart';
import '../../../models/cart_item_model.dart';
import '../widgets/empty_cart.dart';
import '../widgets/cart_item_widget.dart';
import '../widgets/cart_summary.dart';
import 'package:stylish_shopping_app/widgets/custom_app_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

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

    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBar(
          leading: IconButton(
            icon: SvgPicture.asset('assets/icons/app_icons/Arrow_Left.svg'),
            onPressed: () => Navigator.popAndPushNamed(context, AppRoutes.home),
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
        body: cartItems.isEmpty
            ? const EmptyCart()
            : Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: ListView.builder(
                        itemCount: cartItems.length,
                        itemBuilder: (context, index) {
                          return CartItemWidget(
                            item: cartItems[index],
                            onIncrement: () => _incrementQuantity(index),
                            onDecrement: () => _decrementQuantity(index),
                            onRemove: () => _removeItem(index),
                          );
                        },
                      ),
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
              ),
      ),
    );
  }
}
