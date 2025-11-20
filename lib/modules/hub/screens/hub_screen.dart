import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stylish_shopping_app/core/constants/resources.dart';
import 'package:stylish_shopping_app/core/extensions/theme_extension.dart';
import 'package:stylish_shopping_app/core/theme/app_text_style.dart';
import 'package:stylish_shopping_app/modules/homepage/screens/home_page_screen.dart';
import 'package:stylish_shopping_app/modules/wishlist/screens/wishlist_screen.dart';
import 'package:stylish_shopping_app/modules/cart/screens/cart_screen.dart';
import 'package:stylish_shopping_app/modules/hub/widgets/app_side_menu.dart';
import 'package:stylish_shopping_app/widgets/custom_app_bar.dart';
import 'dart:ui';

class HubScreen extends StatefulWidget {
  const HubScreen({super.key});

  @override
  State<HubScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HubScreen>
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

  PreferredSizeWidget? _buildAppBar(BuildContext context) {
    // Home page (index 0) - show menu and cart
    if (_selectedIndex == 0) {
      return CustomAppBar(
        leading: Builder(
          builder: (context) {
            return AppBarIconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              svgPath: IconPath.menu,
            );
          },
        ),
        action: AppBarIconButton(
          onPressed: () => _onItemTapped(2),
          svgPath: IconPath.bag,
        ),
      );
    }

    // Cart page (index 2) - only show title, no cart icon
    if (_selectedIndex == 2) {
      return CustomAppBar(
        title: Text(
          'Cart',
          style: AppTextStyle.s17.copyWith(
            fontWeight: FontWeight.w600,
            color: context.primaryTextColor,
          ),
        ),
      );
    }

    // Wishlist (index 1) and My Cards (index 3) - show title and cart icon
    return CustomAppBar(
      title: Text(
        _titles[_selectedIndex] ?? '',
        style: AppTextStyle.s17.copyWith(
          fontWeight: FontWeight.w600,
          color: context.primaryTextColor,
        ),
      ),
      action: AppBarIconButton(
        onPressed: () => _onItemTapped(2),
        svgPath: IconPath.bag,
      ),
    );
  }

  Widget _buildBottomNavBar() {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: context.secondaryColor,
        boxShadow: [
          BoxShadow(
            color: const Color(0x1D1E2014),
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
          _buildNavItem(0, 'Home', IconPath.home),
          _buildNavItem(1, 'Wishlist', IconPath.heart),
          _buildNavItem(2, 'Cart', IconPath.bag),
          _buildNavItem(3, 'My Cards', IconPath.wallet),
        ],
      ),
    );
  }

  BottomNavigationBarItem _buildNavItem(
    int index,
    String label,
    String iconPath,
  ) {
    final isSelected = _selectedIndex == index;

    return BottomNavigationBarItem(
      icon: isSelected
          ? Text(
              label,
              style: AppTextStyle.s11.copyWith(
                color: const Color(0xff9775FA),
                fontWeight: FontWeight.w500,
              ),
            )
          : SvgPicture.asset(
              iconPath,
              width: 20,
              height: 20,
              colorFilter: const ColorFilter.mode(
                Color(0xff8F959E),
                BlendMode.srcIn,
              ),
            ),
      label: '',
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget currentScreen = _selectedIndex == 2
        ? SlideTransition(
            position: _slideAnimation,
            child: _screens[_selectedIndex],
          )
        : _screens[_selectedIndex];

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: SafeArea(
        top: false,
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: context.backgroundColor,
          drawer: _selectedIndex == 0
              ? SafeArea(
                  top: false,
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Drawer(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.zero,
                      ),
                      child: AppSideMenu(onNavigateToTab: _onItemTapped),
                    ),
                  ),
                )
              : null,
          appBar: _buildAppBar(context),
          body: currentScreen,
          bottomNavigationBar: _buildBottomNavBar(),
        ),
      ),
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
