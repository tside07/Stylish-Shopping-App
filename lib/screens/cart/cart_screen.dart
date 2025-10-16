// File: lib/screens/cart/cart_screen.dart
import 'package:flutter/material.dart';
import 'package:stylish_shopping_app/utils/routes.dart';
import '../../core/theme/app_text_style.dart';
import '../../models/cart_item_model.dart';
import 'widgets/empty_cart.dart';
import 'widgets/cart_item_widget.dart';
import 'widgets/cart_summary.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  // Danh sách giỏ hàng
  List<CartItem> cartItems = [
    CartItem(
      id: '1',
      productName: "Men's Tie-Dye T-Shirt Nike Sportswear",
      productImage: 'assets/images/products/product1.png',
      price: '\$90',
      taxPrice: ' (+\$4.00 Tax)', // Tax
      size: 'S',
      color: 'Red',
      quantity: 1,
    ),
    CartItem(
      id: '2',
      productName: "Men's Tie-Dye T-Shirt Nike Sportswear",
      productImage: 'assets/images/products/product7.png',
      price: '\$45',
      taxPrice: ' (+\$4.00 Tax)', // Tax
      size: 'S',
      color: 'Red',
      quantity: 1,
    ),
    CartItem(
      id: '3',
      productName: "Men's Tie-Dye T-Shirt Nike Sportswear",
      productImage: 'assets/images/products/product4.png',
      price: '\$45',
      taxPrice: ' (+\$4.00 Tax)', // Tax
      size: 'S',
      color: 'Red',
      quantity: 1,
    ),
  ];

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
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Color(0xff1D1E20)),
            onPressed: () => Navigator.popAndPushNamed(context, AppRoutes.home),
          ),
          centerTitle: true,
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
                      // TODO: Navigate to checkout screen
                    },
                  ),
                ],
              ),
      ),
    );
  }
}
