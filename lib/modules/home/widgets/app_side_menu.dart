import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:stylish_shopping_app/core/constants/resources.dart';
import 'package:stylish_shopping_app/core/widgets/app_gap.dart';
import 'package:stylish_shopping_app/core/theme/theme_provider.dart';
import 'package:stylish_shopping_app/core/extensions/theme_extension.dart';
import '../../../core/theme/app_text_style.dart';
import '../../../utils/routes.dart';

class AppSideMenu extends StatefulWidget {
  final Function(int)? onNavigateToTab;

  const AppSideMenu({super.key, this.onNavigateToTab});

  @override
  State<AppSideMenu> createState() => _AppSideMenuState();
}

class _AppSideMenuState extends State<AppSideMenu>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _slideAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _slideAnimation = Tween<double>(begin: -1.0, end: 0.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.3, 1.0, curve: Curves.easeOut),
      ),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _navigateToTab(int index) {
    Navigator.pop(context);
    widget.onNavigateToTab?.call(index);
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDark = context.isDarkMode;

    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(_slideAnimation.value * 300, 0),
          child: Opacity(
            opacity: _fadeAnimation.value,
            child: Container(
              width: 300,
              color: context.surfaceColor,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SafeArea(
                child: Column(
                  children: [
                    AppGap.h10,

                    // Header - Menu Icon
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: isDark
                                ? Colors.white.withValues(alpha: 0.1)
                                : const Color(0xffF5F6FA),
                          ),
                          child: IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: SvgPicture.asset(
                              IconSideMenu.sideMenu,
                              width: 25,
                              height: 25,
                              colorFilter: ColorFilter.mode(
                                context.primaryTextColor,
                                BlendMode.srcIn,
                              ),
                            ),
                            padding: const EdgeInsets.all(10),
                            constraints: const BoxConstraints(),
                          ),
                        ),
                      ],
                    ),

                    AppGap.h30,

                    // Profile Section
                    Row(
                      children: [
                        Container(
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: isDark
                                ? Colors.white.withValues(alpha: 0.1)
                                : const Color(
                                    0xff8F959E,
                                  ).withValues(alpha: 0.05),
                          ),
                          child: Center(
                            child: SvgPicture.asset(
                              IconSideMenu.person,
                              width: 24,
                              height: 24,
                              colorFilter: ColorFilter.mode(
                                context.primaryTextColor,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                        ),

                        AppGap.w15,

                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Not updated',
                                    style: AppTextStyle.s17.copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: context.primaryTextColor,
                                    ),
                                  ),
                                  AppGap.h4,
                                  Row(
                                    children: [
                                      Text(
                                        'Verified Profile',
                                        style: AppTextStyle.s13.copyWith(
                                          color: isDark
                                              ? Colors.grey[400]
                                              : const Color(0xff8F959E),
                                        ),
                                      ),
                                      AppGap.w5,
                                      SvgPicture.asset(
                                        IconSideMenu.check,
                                        width: 15,
                                        height: 15,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: isDark
                                      ? Colors.white.withValues(alpha: 0.1)
                                      : const Color(0xffF5F5F5),
                                ),
                                child: Text(
                                  '3 Orders',
                                  style: AppTextStyle.s13.copyWith(
                                    color: isDark
                                        ? Colors.grey[400]
                                        : const Color(0xff8F959E),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    AppGap.h30,

                    _MenuTile(
                      icon: IconSideMenu.sun,
                      title: 'Dark Mode',
                      isDark: isDark,
                      trailing: Switch(
                        value: themeProvider.isDarkMode,
                        activeThumbColor: const Color(0xff34C759),
                        onChanged: (value) {
                          themeProvider.toggleTheme();
                        },
                      ),
                    ),

                    AppGap.h5,

                    // Menu Items
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      child: _MenuTile(
                        icon: IconSideMenu.infoCircle,
                        title: 'Account Information',
                        isDark: isDark,
                        onTap: () => Navigator.pop(context),
                      ),
                    ),
                    AppGap.h5,

                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      child: _MenuTile(
                        icon: IconSideMenu.lock,
                        title: 'Change Password',
                        isDark: isDark,
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.pushNamed(context, AppRoutes.changePw);
                        },
                      ),
                    ),
                    AppGap.h5,

                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      child: _MenuTile(
                        icon: IconPath.bag,
                        title: 'Order',
                        isDark: isDark,
                        onTap: () => _navigateToTab(2),
                      ),
                    ),
                    AppGap.h5,

                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      child: _MenuTile(
                        icon: IconPath.wallet,
                        title: 'My Cards',
                        isDark: isDark,
                        onTap: () => _navigateToTab(3),
                      ),
                    ),
                    AppGap.h5,

                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      child: _MenuTile(
                        icon: IconPath.heart,
                        title: 'Wishlist',
                        isDark: isDark,
                        onTap: () => _navigateToTab(1),
                      ),
                    ),
                    AppGap.h5,

                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      child: _MenuTile(
                        icon: IconSideMenu.setting,
                        title: 'Settings',
                        isDark: isDark,
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),

                    const Spacer(),

                    // Logout
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        child: InkWell(
                          onTap: () {
                            Navigator.popAndPushNamed(
                              context,
                              AppRoutes.getStarted,
                            );
                          },
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                IconSideMenu.logout,
                                colorFilter: const ColorFilter.mode(
                                  Color(0xffFF4747),
                                  BlendMode.srcIn,
                                ),
                              ),
                              AppGap.w15,
                              Text(
                                'Logout',
                                style: AppTextStyle.s15.copyWith(
                                  color: const Color(0xffFF4747),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    AppGap.h60,
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _MenuTile extends StatelessWidget {
  final String icon;
  final String title;
  final VoidCallback? onTap;
  final Widget? trailing;
  final bool isDark;

  const _MenuTile({
    required this.icon,
    required this.title,
    required this.isDark,
    this.onTap,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          SvgPicture.asset(
            icon,
            width: 25,
            height: 25,
            colorFilter: ColorFilter.mode(
              context.primaryTextColor,
              BlendMode.srcIn,
            ),
          ),
          AppGap.w10,
          Expanded(
            child: Text(
              title,
              style: AppTextStyle.s15.copyWith(color: context.primaryTextColor),
            ),
          ),
          if (trailing != null) trailing!,
        ],
      ),
    );
  }
}
