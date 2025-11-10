import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stylish_shopping_app/core/constants/resources.dart';
import 'package:stylish_shopping_app/modules/home/widgets/app_side_menu.dart';
import 'package:stylish_shopping_app/core/theme/app_text_style.dart';
import 'package:stylish_shopping_app/widgets/custom_app_bar.dart';

class HubScreen extends StatelessWidget {
  final Widget child;
  final int selectedIndex;
  final Function(int) onNavigationTap;
  final VoidCallback? onBackPressed;
  final String? title;
  final bool showDrawer;
  final bool showBackButton;

  const HubScreen({
    super.key,
    required this.child,
    required this.selectedIndex,
    required this.onNavigationTap,
    this.onBackPressed,
    this.title,
    this.showDrawer = false,
    this.showBackButton = false,
  });

  PreferredSizeWidget? buildAppBar(BuildContext context) {
    if (selectedIndex == 0) {
      return CustomAppBar(
        leading: Builder(
          builder: (context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: SvgPicture.asset(
                IconPath.menu,
                width: 25,
                height: 25,
              ),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
            );
          },
        ),
        action: IconButton(
          onPressed: () => onNavigationTap(2), // Navigate to Cart
          icon: SvgPicture.asset(IconPath.bag),
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
        ),
      );
    }

    if (showBackButton || title != null) {
      return CustomAppBar(
        leading: IconButton(
          onPressed: onBackPressed ?? () => onNavigationTap(0),
          icon: SvgPicture.asset(
            IconPath.arrowLeft,
            width: 25,
            height: 25,
          ),
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
        ),
        title: title != null
            ? Text(
                title!,
                style: AppTextStyle.s17.copyWith(
                  fontWeight: FontWeight.w600,
                  color: const Color(0xff1D1E20),
                ),
              )
            : null,
        action: selectedIndex != 2
            ? IconButton(
                onPressed: () => onNavigationTap(2),
                icon: SvgPicture.asset(IconPath.bag),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              )
            : null,
      );
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: SafeArea(
        top: false,
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: const Color(0xffFEFEFE),

          drawer: showDrawer
              ? SafeArea(
                  top: false,
                  child: Stack(
                    children: [
                      BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: const SizedBox.expand(),
                      ),
                      Drawer(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.zero,
                        ),
                        child: AppSideMenu(onNavigateToTab: onNavigationTap),
                      ),
                    ],
                  ),
                )
              : null,

          appBar: buildAppBar(context),

          body: child,

          bottomNavigationBar: buildBottomNavBar(),
        ),
      ),
    );
  }

  Widget buildBottomNavBar() {
    return Container(
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
        currentIndex: selectedIndex,
        onTap: onNavigationTap,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xff9775FA),
        unselectedItemColor: const Color(0xff8F959E),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
        items: [
          buildNavItem(0, 'Home', IconPath.home),
          buildNavItem(1, 'Wishlist', IconPath.heart),
          buildNavItem(2, 'Cart', IconPath.bag),
          buildNavItem(3, 'My Cards', IconPath.wallet),
        ],
      ),
    );
  }

  BottomNavigationBarItem buildNavItem(
    int index,
    String label,
    String iconPath,
  ) {
    final isSelected = selectedIndex == index;

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
}
