import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
              // Items
              AvailableItem(),

              // Function
              FilterSortBottomSheet(),
            ],
          ),
        ),

        // Products grid
        ProductGrid(),
      ],
    );
  }
}
