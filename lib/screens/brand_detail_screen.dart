import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stylish_shopping_app/core/theme/app_text_style.dart';
import 'package:stylish_shopping_app/data/products_data.dart';
import 'package:stylish_shopping_app/models/product_detail_model.dart';
import 'package:stylish_shopping_app/screens/product_detail_screen.dart';
import 'package:stylish_shopping_app/utils/routes.dart';
import 'package:stylish_shopping_app/widgets/filter_bottom_sheet.dart';
import 'package:stylish_shopping_app/widgets/sort_bottom_sheet.dart';
import '../widgets/custom_app_bar.dart';

class BrandDetailScreen extends StatelessWidget {
  final String brandName;
  final String brandLogo;

  const BrandDetailScreen({
    super.key,
    required this.brandName,
    required this.brandLogo,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: const Color(0xffFEFEFE),
        appBar: CustomAppBar(
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: SvgPicture.asset('assets/icons/app_icons/Arrow_Left.svg'),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
          title: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              boxShadow: [BoxShadow(color: Color(0xffF5F6FA))],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset(brandLogo, height: 30),
          ),
          action: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.cart);
            },
            icon: SvgPicture.asset('assets/icons/app_icons/Bag.svg'),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
        ),
        body: _Body(),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

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
                  const SizedBox(height: 5),
                  Text(
                    'Available in stock',
                    style: AppTextStyle.s15.copyWith(
                      color: const Color(0xff8F959E),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  _IconButton(
                    icon: 'assets/icons/app_icons/Filter.svg',
                    label: '',
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
              ),
            ],
          ),
        ),

        // Products grid
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
              return _ProductItem(product: product);
            },
          ),
        ),
      ],
    );
  }
}

class _IconButton extends StatelessWidget {
  final String icon;
  final String label;
  final VoidCallback onTap;

  const _IconButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

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
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
