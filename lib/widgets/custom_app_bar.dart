import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? leading;
  final Widget? title;
  final Widget? action;
  final Color? backgroundColor;
  final double? elevation;

  const CustomAppBar({
    super.key,
    this.leading,
    this.title,
    this.action,
    this.backgroundColor,
    this.elevation,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor ?? const Color(0xffFEFEFE),
      elevation: elevation ?? 0,
      automaticallyImplyLeading: false,
      leading: leading != null
          ? Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [BoxShadow(color: const Color(0xffF5F6FA))],
                ),
                child: leading,
              ),
            )
          : null,
      centerTitle: true,
      title: title,
      actions: action != null
          ? [
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [BoxShadow(color: const Color(0xffF5F6FA))],
                  ),
                  child: action,
                ),
              ),
            ]
          : null,
    );
  }
}

// Helper widget cho leading/action icons
class AppBarIconButton extends StatelessWidget {
  final String? svgPath;
  final String? pngPath;
  final IconData? icon;
  final VoidCallback onPressed;
  final double? width;
  final double? height;
  final Color? color;

  const AppBarIconButton({
    super.key,
    this.svgPath,
    this.pngPath,
    this.icon,
    required this.onPressed,
    this.width,
    this.height,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    Widget iconWidget;

    if (svgPath != null) {
      iconWidget = SvgPicture.asset(
        svgPath!,
        width: width ?? 24,
        height: height ?? 24,
        colorFilter: color != null
            ? ColorFilter.mode(color!, BlendMode.srcIn)
            : null,
      );
    } else if (pngPath != null) {
      iconWidget = Image.asset(
        pngPath!,
        width: width ?? 24,
        height: height ?? 24,
      );
    } else if (icon != null) {
      iconWidget = Icon(
        icon,
        size: width ?? 24,
        color: color ?? const Color(0xff1D1E20),
      );
    } else {
      iconWidget = const SizedBox.shrink();
    }

    return IconButton(
      onPressed: onPressed,
      icon: iconWidget,
      padding: EdgeInsets.zero,
      constraints: const BoxConstraints(),
    );
  }
}


