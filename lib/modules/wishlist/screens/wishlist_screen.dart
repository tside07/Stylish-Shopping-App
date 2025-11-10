import 'package:flutter/material.dart';
import 'package:stylish_shopping_app/core/widgets/app_gap.dart';
import '../../../core/theme/app_text_style.dart';
import 'package:stylish_shopping_app/data/products_data.dart';
import '../../../widgets/product_item.dart';
import 'package:stylish_shopping_app/modules/wishlist/widgets/wishlist_widget.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${products.length} Items',
                    style: AppTextStyle.s17.copyWith(
                      color: const Color(0xff1D1E20),
                    ),
                  ),
                  AppGap.h5,
                  Text(
                    'in wishlist',
                    style: AppTextStyle.s15.copyWith(
                      color: const Color(0xff8F959E),
                    ),
                  ),
                ],
              ),
              EditButton(),
            ],
          ),
        ),
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.65,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
            ),
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return ProductItem(product: product);
            },
          ),
        ),
      ],
    );
  }
}
