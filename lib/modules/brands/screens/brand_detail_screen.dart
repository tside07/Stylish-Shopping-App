import 'package:flutter/material.dart';
import 'package:stylish_shopping_app/core/constants/resources.dart';
import 'package:stylish_shopping_app/utils/routes.dart';
import '../../../widgets/custom_app_bar.dart';
import 'package:stylish_shopping_app/modules/brands/widgets/brand_detail_widget.dart';

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
          leading: AppBarIconButton(
            onPressed: () => Navigator.pop(context),
            svgPath: IconPath.arrowLeft,
          ),
          title: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              boxShadow: const [BoxShadow(color: Color(0xffF5F6FA))],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset(brandLogo, height: 30),
          ),
          action: AppBarIconButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.cart);
            },
            svgPath: 'assets/icons/app_icons/Bag.svg',
          ),
        ),
        body: _Body(brandLogo: brandLogo),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  final String brandLogo;

  const _Body({required this.brandLogo});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Items
              const AvailableItem(),

              // Function
              const FilterSortBottomSheet(),
            ],
          ),
        ),

        // Products grid
        ProductGrid(brandLogo: brandLogo),
      ],
    );
  }
}
