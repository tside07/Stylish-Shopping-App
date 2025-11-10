import 'package:flutter/material.dart';
import 'package:stylish_shopping_app/modules/hub/screens/hub_screen.dart';
import 'package:stylish_shopping_app/modules/homepage/screens/home_page_screen.dart';
import 'package:stylish_shopping_app/modules/wishlist/screens/wishlist_screen.dart';
import 'package:stylish_shopping_app/modules/cart/screens/cart_screen.dart';
import 'package:stylish_shopping_app/core/theme/app_text_style.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _slideAnimation =
        Tween<Offset>(begin: const Offset(1.0, 0.0), end: Offset.zero).animate(
          CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
        );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  final List<Widget> _screens = const [
    HomePageScreen(),
    WishlistScreen(),
    CartScreen(isInHub: true),
    _MyCardScreen(),
  ];

  final List<String?> _titles = [null, 'Wishlist', 'Cart', 'My Cards'];

  void _onItemTapped(int index) {
    if (index == 2 && _selectedIndex != 2) {
      _animationController.forward(from: 0.0);
    }

    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget currentChild = _selectedIndex == 2
        ? SlideTransition(
            position: _slideAnimation,
            child: _screens[_selectedIndex],
          )
        : _screens[_selectedIndex];

    return HubScreen(
      selectedIndex: _selectedIndex,
      onNavigationTap: _onItemTapped,
      title: _titles[_selectedIndex],
      showDrawer: _selectedIndex == 0,
      showBackButton: _selectedIndex != 0,
      child: currentChild,
    );
  }
}

class _MyCardScreen extends StatelessWidget {
  const _MyCardScreen();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('My Cards', style: AppTextStyle.base.copyWith(fontSize: 24)),
    );
  }
}
