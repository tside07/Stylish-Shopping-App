import 'package:flutter/material.dart';
import '../core/theme/app_text_style.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = <Widget>[
    const HomePage(),
    const WishlistPage(),
    const CartPage(),
    const WalletPage(),
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
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leading: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: IconButton(
                onPressed: () {
                  // Open drawer
                },
                icon: const Icon(Icons.menu, color: Color(0xff1D1E20)),
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: IconButton(
                  onPressed: () {
                    // Navigate to cart
                  },
                  icon: const Icon(
                    Icons.shopping_bag_outlined,
                    color: Color(0xff1D1E20),
                  ),
                ),
              ),
            ],
          ),
          body: _pages[_selectedIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: const Color(0xff9775FA),
            unselectedItemColor: const Color(0xff8F959E),
            selectedLabelStyle: AppTextStyle.s13,
            unselectedLabelStyle: AppTextStyle.s13,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                activeIcon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border),
                activeIcon: Icon(Icons.favorite),
                label: 'Wishlist',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag_outlined),
                activeIcon: Icon(Icons.shopping_bag),
                label: 'Cart',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.wallet_outlined),
                activeIcon: Icon(Icons.wallet),
                label: 'Wallet',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ===== HOME PAGE =====
class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
                child: const Icon(
                  Icons.mic,
                  color: Color(0xffFEFEFE),
                  size: 24,
                ),
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
          SingleChildScrollView( //TODO: Change logo puma and icons
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

          const SizedBox(height: 25),

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
            itemCount: 4,
            itemBuilder: (context, index) {
              return _ProductItem(
                image: 'assets/images/products/product${index + 1}.png',
                name: index == 0
                    ? 'Nike Sportswear Club Fleece'
                    : index == 1
                    ? 'Trail Running Jacket Nike Windrunner'
                    : index == 2
                    ? 'Training Top Nike Sport Clash'
                    : 'Trail Running Jacket Nike Windrunner',
                price: index == 0
                    ? '\$99'
                    : index == 1
                    ? '\$99'
                    : index == 2
                    ? '\$100'
                    : '\$70',
              );
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
  final String image;
  final String name;
  final String price;

  const _ProductItem({
    required this.image,
    required this.name,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(15),
                  ),
                  child: Image.asset(image, fit: BoxFit.contain),
                ),
              ),
              const Positioned(
                top: 10,
                right: 10,
                child: Icon(
                  Icons.favorite_border,
                  size: 20,
                  color: Color(0xff8F959E),
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
                    name,
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
                    price,
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
    );
  }
}

// wishlist page
class WishlistPage extends StatelessWidget {
  const WishlistPage({super.key});

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

// cart page
class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Cart Page', style: AppTextStyle.base.copyWith(fontSize: 24)),
    );
  }
}

// wallet page
class WalletPage extends StatelessWidget {
  const WalletPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Wallet Page',
        style: AppTextStyle.base.copyWith(fontSize: 24),
      ),
    );
  }
}


