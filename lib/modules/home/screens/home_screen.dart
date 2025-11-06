import 'dart:ui';

import 'package:flutter/material.dart';
// import 'package:stylish_shopping_app/screens/hub_screen.dart';
import 'package:stylish_shopping_app/utils/routes.dart';
import '../../../core/theme/app_text_style.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stylish_shopping_app/modules/wishlist/screens/wishlist_screen.dart';
import '../../cart/screens/cart_screen.dart';
import 'package:stylish_shopping_app/modules/home/widgets/app_side_menu.dart';
import 'package:stylish_shopping_app/modules/homepage/screens/home_page_screen.dart';
import '../../../widgets/custom_app_bar.dart';

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

  final List<Widget> _screens = <Widget>[
    const HomePageScreen(),
    const WishlistScreen(),
    const CartScreen(),
    const _MyCardScreen(),
  ];

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
    // return HubScreen(child: selectedIndex == 2
    //           ? SlideTransition(
    //               position: _slideAnimation,
    //               child: _screens[_selectedIndex],
    //             )
    //           : _screens[_selectedIndex],)
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: SafeArea(
        top: false,
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: const Color(0xffFEFEFE),
          drawer: SafeArea(
            top: false,
            child: Stack(
              children: [
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: const SizedBox.expand(),
                ),
                Drawer(child: const AppSideMenu()),
              ],
            ),
          ),
          appBar: _selectedIndex == 0
              ? CustomAppBar(
                  leading: Builder(
                    builder: (context) {
                      return IconButton(
                        onPressed: () {
                          Scaffold.of(context).openDrawer();
                        },
                        icon: SvgPicture.asset(
                          'assets/icons/app_icons/Menu.svg',
                          width: 25,
                          height: 25,
                        ),
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                      );
                    },
                  ),
                  action: IconButton(
                    onPressed: () {
                      _onItemTapped(2);
                    },
                    icon: SvgPicture.asset('assets/icons/app_icons/Bag.svg'),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                )
              // Wishlist screen
              : _selectedIndex == 1
              ? CustomAppBar(
                  leading: IconButton(
                    onPressed: () {
                      Navigator.popAndPushNamed(context, AppRoutes.homepage);
                    },
                    icon: SvgPicture.asset(
                      'assets/icons/app_icons/Arrow_Left.svg',
                      width: 25,
                      height: 25,
                    ),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                  title: Text(
                    'Wishlist',
                    style: AppTextStyle.s17.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  action: IconButton(
                    onPressed: () {
                      _onItemTapped(2);
                    },
                    icon: SvgPicture.asset('assets/icons/app_icons/Bag.svg'),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                )
              : null,
          body: _selectedIndex == 2
              ? SlideTransition(
                  position: _slideAnimation,
                  child: _screens[_selectedIndex],
                )
              : _screens[_selectedIndex],
          bottomNavigationBar: Container(
            height: 80,
            decoration: BoxDecoration(
              color: Colors.white,
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
                          width: 20,
                          height: 20,
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
                          width: 20,
                          height: 20,
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
                          width: 20,
                          height: 20,
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
                          width: 20,
                          height: 20,
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
