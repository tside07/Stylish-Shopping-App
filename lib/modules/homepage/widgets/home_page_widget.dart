import 'package:flutter/material.dart';
import 'package:stylish_shopping_app/core/constants/resources.dart';
import 'package:stylish_shopping_app/core/extensions/theme_extension.dart';
import 'package:stylish_shopping_app/core/widgets/app_gap.dart';
import '../../../core/theme/app_text_style.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../brands/screens/brand_detail_screen.dart';
import 'package:stylish_shopping_app/models/brand_model.dart';

class BrandItem extends StatelessWidget {
  final Brand brand;

  const BrandItem({super.key, required this.brand});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                BrandDetailScreen(brandName: brand.name, brandLogo: brand.logo),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: context.secondaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(5),
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: context.secondaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset(
                brand.logo,
                color: context.primaryTextColor,
                width: 25,
                height: 17,
              ),
            ),
            AppGap.w10,
            Text(
              brand.name,
              style: AppTextStyle.s15.copyWith(
                fontWeight: FontWeight.w500,
                color: context.primaryTextColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WelcomeBanner extends StatelessWidget {
  final String user;
  final String banner;

  const WelcomeBanner({super.key, required this.user, required this.banner});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            user,
            style: AppTextStyle.base.copyWith(
              fontSize: 28,
              fontWeight: FontWeight.w600,
              color: context.primaryTextColor,
            ),
          ),
          AppGap.h5,
          Text(
            banner,
            style: AppTextStyle.s15.copyWith(
              fontWeight: FontWeight.w400,
              color: const Color(0xff8F959E),
            ),
          ),
        ],
      ),
    );
  }
}

class HomeSearchBar extends StatelessWidget {
  final TextEditingController searchController;

  const HomeSearchBar({super.key, required this.searchController});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16.5, vertical: 6),
            decoration: BoxDecoration(
              color: context.backgroundAppBarIconColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                SvgPicture.asset(IconPath.search, width: 20, height: 20),
                AppGap.w10,
                Expanded(
                  child: TextField(
                    controller: searchController,
                    keyboardType: TextInputType.text,
                    style: AppTextStyle.s15.copyWith(
                      fontWeight: FontWeight.w400,
                      color: Color(0xff8F959E),
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Search...',
                      hintStyle: AppTextStyle.s15.copyWith(
                        fontWeight: FontWeight.w400,
                        color: Color(0xff8F959E),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        AppGap.w10,
        Container(
          padding: const EdgeInsets.all(16.5),
          decoration: BoxDecoration(
            color: const Color(0xff9775FA),
            borderRadius: BorderRadius.circular(10),
          ),
          child: SvgPicture.asset(
            // 'assets/icons/app_icons/Voice.svg',
            IconPath.voice,
            width: 24,
            height: 24,
          ),
        ),
      ],
    );
  }
}
