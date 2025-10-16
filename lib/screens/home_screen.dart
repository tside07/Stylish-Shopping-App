import 'package:flutter/material.dart';
import '../core/theme/app_text_style.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../screens/product_detail_screen.dart';
import 'cart/cart_screen.dart';
import 'package:stylish_shopping_app/data/products_data.dart';
import 'package:stylish_shopping_app/models/product_detail_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = <Widget>[
    const _HomePage(),
    const _WishlistScreen(),
    const CartScreen(),
    const _MyCardScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: SafeArea(
        top: false,
        child: Scaffold(
          backgroundColor: Color(0xffFEFEFE),
          appBar: _selectedIndex == 0
              ? AppBar(
                  backgroundColor: Color(0xffFEFEFE),
                  elevation: 0,
                  leading: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xffF5F6FA),
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: IconButton(
                        onPressed: () {
                          // Open drawer
                        },
                        icon: SvgPicture.asset(
                          'assets/icons/app_icons/Menu.svg',
                          width: 24,
                          height: 24,
                        ),
                      ),
                    ),
                  ),
                  actions: [
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xffF5F6FA),
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              _selectedIndex = 2; // Navigate to Cart tab
                            });
                          },
                          icon: SvgPicture.asset(
                            'assets/icons/app_icons/Bag.svg',
                            width: 24,
                            height: 24,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              : null,
          body: _screens[_selectedIndex],
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Color(0x1D1E2014),
                  blurRadius: 20,
                  offset: const Offset(0, -4),
                ),
              ],
            ),
            child: BottomNavigationBar(
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: const Color(0xff9775FA),
              unselectedItemColor: const Color(0xff8F959E),
              showSelectedLabels: false,
              showUnselectedLabels: false,
              elevation: 0,
              backgroundColor: Colors.transparent,
              items: [
                BottomNavigationBarItem(
                  icon: _selectedIndex == 0
                      ? Text(
                          'Home',
                          style: AppTextStyle.s11.copyWith(
                            color: const Color(0xff9775FA),
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      : SvgPicture.asset(
                          'assets/icons/app_icons/Home.svg',
                          width: 25,
                          height: 25,
                          colorFilter: const ColorFilter.mode(
                            Color(0xff8F959E),
                            BlendMode.srcIn,
                          ),
                        ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: _selectedIndex == 1
                      ? Text(
                          'Wishlist',
                          style: AppTextStyle.s11.copyWith(
                            color: const Color(0xff9775FA),
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      : SvgPicture.asset(
                          'assets/icons/app_icons/Heart.svg',
                          width: 25,
                          height: 25,
                          colorFilter: const ColorFilter.mode(
                            Color(0xff8F959E),
                            BlendMode.srcIn,
                          ),
                        ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: _selectedIndex == 2
                      ? Text(
                          'Cart',
                          style: AppTextStyle.s11.copyWith(
                            color: const Color(0xff9775FA),
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      : SvgPicture.asset(
                          'assets/icons/app_icons/Bag.svg',
                          width: 25,
                          height: 25,
                          colorFilter: const ColorFilter.mode(
                            Color(0xff8F959E),
                            BlendMode.srcIn,
                          ),
                        ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: _selectedIndex == 3
                      ? Text(
                          'My Cards',
                          style: AppTextStyle.s11.copyWith(
                            color: const Color(0xff9775FA),
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      : SvgPicture.asset(
                          'assets/icons/app_icons/Wallet.svg',
                          width: 25,
                          height: 25,
                          colorFilter: const ColorFilter.mode(
                            Color(0xff8F959E),
                            BlendMode.srcIn,
                          ),
                        ),
                  label: '',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Homepage
class _HomePage extends StatelessWidget {
  const _HomePage();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Welcome banner
          Container(
            width: double.infinity,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hemendra',
                  style: AppTextStyle.base.copyWith(
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xff1D1E20),
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  'Welcome to Laza.',
                  style: AppTextStyle.s15.copyWith(
                    fontWeight: FontWeight.w400,
                    color: const Color(0xff8F959E),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // Search bar
          Row(
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16.5),
                  decoration: BoxDecoration(
                    color: const Color(0xffF5F6FA),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.search,
                        color: Color(0xff8F959E),
                        size: 20,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        'Search...',
                        style: AppTextStyle.s15.copyWith(
                          color: const Color(0xff8F959E),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Container(
                padding: const EdgeInsets.all(16.5),
                decoration: BoxDecoration(
                  color: const Color(0xff9775FA),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(Icons.mic, color: Color(0xffFEFEFE), size: 24),
              ),
            ],
          ),

          const SizedBox(height: 25),

          // Choose Brand
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Choose Brand',
                style: AppTextStyle.s17.copyWith(
                  color: const Color(0xff1D1E20),
                ),
              ),
              Text(
                'View All',
                style: AppTextStyle.s13.copyWith(
                  color: const Color(0xff8F959E),
                  height: 14 / 13,
                ),
              ),
            ],
          ),

          const SizedBox(height: 15),

          // Brand logos
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _BrandItem(
                  logo: 'assets/images/brands/logo_adidas.png',
                  name: 'Adidas',
                ),
                const SizedBox(width: 10),
                _BrandItem(
                  logo: 'assets/images/brands/logo_nike.png',
                  name: 'Nike',
                ),
                const SizedBox(width: 10),
                _BrandItem(
                  logo: 'assets/images/brands/logo_fila.png',
                  name: 'Fila',
                ),
                const SizedBox(width: 10),
                _BrandItem(
                  logo: 'assets/images/brands/logo_puma.png',
                  name: 'Puma',
                ),
              ],
            ),
          ),

          const SizedBox(height: 15),

          // New Arrival
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'New Arrival',
                style: AppTextStyle.base.copyWith(
                  fontSize: 17,
                  color: const Color(0xff1D1E20),
                ),
              ),
              Text(
                'View All',
                style: AppTextStyle.s13.copyWith(
                  color: const Color(0xff8F959E),
                  height: 14 / 13,
                ),
              ),
            ],
          ),

          const SizedBox(height: 15),

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
              return _ProductItem(product: product);
            },
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class _BrandItem extends StatelessWidget {
  final String logo;
  final String name;

  const _BrandItem({required this.logo, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: const Color(0xffF5F6FA),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(5),
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: const Color(0xffFEFEFE),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset(logo, width: 25, height: 17),
          ),
          const SizedBox(width: 10),
          Text(
            name,
            style: AppTextStyle.s15.copyWith(
              fontWeight: FontWeight.w500,
              color: const Color(0xff1D1E20),
            ),
          ),
        ],
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
                  child: SvgPicture.asset(
                    'assets/icons/app_icons/Heart.svg',
                    width: 20,
                    height: 20,
                    colorFilter: ColorFilter.mode(
                      Color(0xff8F959E),
                      BlendMode.srcIn,
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

// Wishlist page
class _WishlistScreen extends StatelessWidget {
  const _WishlistScreen();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Wishlist Page',
        style: AppTextStyle.base.copyWith(fontSize: 24),
      ),
    );
  }
}

// Wallet page
class _MyCardScreen extends StatelessWidget {
  const _MyCardScreen();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('My Cards', style: AppTextStyle.base.copyWith(fontSize: 24)),
    );
  }
}
