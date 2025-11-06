import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stylish_shopping_app/core/theme/app_text_style.dart';
import 'package:stylish_shopping_app/data/products_data.dart';
import 'package:stylish_shopping_app/models/product_detail_model.dart';
import 'package:stylish_shopping_app/modules/products/screens/product_detail_screen.dart';
import 'package:stylish_shopping_app/modules/products/widgets/filter_bottom_sheet.dart';
import 'package:stylish_shopping_app/modules/products/widgets/sort_bottom_sheet.dart';


class _IconButton extends StatelessWidget {
  final String icon;
  final String label;
  final VoidCallback onTap;

  const _IconButton({required this.icon, this.label = '', required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(11),
        decoration: BoxDecoration(
          color: const Color(0xffF5F6FA),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            SvgPicture.asset(icon, width: 15, height: 15),
            const SizedBox(width: 5),
            Text(
              label,
              style: AppTextStyle.s15.copyWith(color: const Color(0xff1D1E20)),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProductItem extends StatelessWidget {
  final ProductDetail product;

  const _ProductItem({required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailScreen(product: product),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            Stack(
              children: [
                Container(
                  height: 203,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Color(0xffF5F6FA),
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(15),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(15),
                    ),
                    child: Image.asset(
                      product.productImage,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        'assets/icons/app_icons/Heart.svg',
                        width: 18,
                        height: 18,
                        colorFilter: const ColorFilter.mode(
                          Color(0xff8F959E),
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // Product info
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.productName,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyle.base.copyWith(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff1D1E20),
                        height: 15 / 11,
                      ),
                    ),
                    const SizedBox(height: 5),

                    Text(
                      product.productPrice,
                      style: AppTextStyle.s13.copyWith(
                        fontWeight: FontWeight.w600,
                        color: const Color(0xff1D1E20),
                      ),
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

class ProductGrid extends StatelessWidget {
  const ProductGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
          return _ProductItem(product: product);
        },
      ),
    );
  }
}

class FilterSortBottomSheet extends StatelessWidget {
  const FilterSortBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _IconButton(
          icon: 'assets/icons/app_icons/Filter.svg',
          onTap: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              builder: (context) => const FilterBottomSheet(),
            );
          },
        ),
        const SizedBox(width: 10),

        _IconButton(
          icon: 'assets/icons/app_icons/Sort.svg',
          label: 'Sort',
          onTap: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              builder: (context) => const SortBottomSheet(),
            );
          },
        ),
      ],
    );
  }
}

class AvailableItem extends StatelessWidget {
  const AvailableItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${products.length} Items',
          style: AppTextStyle.s17.copyWith(color: const Color(0xff1D1E20)),
        ),
        const SizedBox(height: 5),
        Text(
          'Available in stock',
          style: AppTextStyle.s15.copyWith(color: const Color(0xff8F959E)),
        ),
      ],
    );
  }
}
