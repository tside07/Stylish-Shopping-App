import 'package:flutter/material.dart';
import 'package:stylish_shopping_app/core/widgets/app_gap.dart';
import 'package:stylish_shopping_app/data/products_data.dart';
import 'package:stylish_shopping_app/models/brand_model.dart';
import 'package:stylish_shopping_app/modules/homepage/widgets/home_page_widget.dart';
import '../../../widgets/product_item.dart';
import '../../../widgets/view_all_button.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              // Welcome banner
              const WelcomeBanner(user: 'Hemendra', banner: 'Welcome to Laza.'),
              AppGap.h20,

              // Search bar
              HomeSearchBar(searchController: _searchController),
              AppGap.h25,

              // Choose Brand
              HomeViewAll(
                header: 'Choose Brand',
                button: 'View All',
                onTap: () {},
              ),
              AppGap.h15,

              // Brand logos
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: brands.asMap().entries.map((entry) {
                    int index = entry.key;
                    Brand brand = entry.value;
                    return Padding(
                      padding: EdgeInsets.only(
                        right: index != brands.length - 1 ? 10 : 0,
                      ),
                      child: BrandItem(brand: brand),
                    );
                  }).toList(),
                ),
              ),
              AppGap.h15,

              // New Arrival
              HomeViewAll(
                header: 'New Arrival',
                button: 'View All',
                onTap: () {},
              ),
              AppGap.h15,
            ]),
          ),
        ),

        // Products grid
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          sliver: SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.65,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
            ),
            delegate: SliverChildBuilderDelegate((context, index) {
              final product = products[index];
              return ProductItem(product: product);
            }, childCount: products.length),
          ),
        ),

        // Bottom spacing
        SliverPadding(padding: const EdgeInsets.only(bottom: 20)),
      ],
    );
  }
}
