import 'package:flutter/material.dart';
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
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: _Body(
        searchController: _searchController,
      ),
    );
  }
}

class _Body extends StatelessWidget {
  final TextEditingController searchController;

  const _Body({required this.searchController});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Welcome banner
        const WelcomeBanner(user: 'Hemendra', banner: 'Welcome to Laza.'),

        const SizedBox(height: 20),

        // Search bar
        HomeSearchBar(searchController: searchController),
        const SizedBox(height: 25),

        // Choose Brand
        HomeViewAll(header: 'Choose Brand', button: 'View All', onTap: () {}),

        const SizedBox(height: 15),

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

        const SizedBox(height: 15),

        // New Arrival
        HomeViewAll(header: 'New Arrival', button: 'View All', onTap: () {}),

        const SizedBox(height: 15),

        //TODO: FIX THIS SHRINK
        
        // Products grid
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
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

        const SizedBox(height: 20),
      ],
    );
  }
}
