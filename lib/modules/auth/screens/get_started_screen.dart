import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stylish_shopping_app/core/extensions/theme_extension.dart';
import 'package:stylish_shopping_app/core/theme/app_text_style.dart';
import 'package:stylish_shopping_app/core/theme/theme_provider.dart';
import 'package:stylish_shopping_app/core/widgets/app_gap.dart';
import 'package:stylish_shopping_app/widgets/custom_title.dart';
import 'package:stylish_shopping_app/widgets/primary_button.dart';
import 'package:stylish_shopping_app/utils/colors.dart';
import 'package:stylish_shopping_app/utils/routes.dart';
import 'package:stylish_shopping_app/widgets/social_login_button.dart';
import 'package:stylish_shopping_app/widgets/custom_app_bar.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDark = themeProvider.isDarkMode;

    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: context.backgroundColor,
        appBar: CustomAppBar(),
        body: Column(
          children: [
            Expanded(child: const _Body()),

            // Already have an account
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account? ',
                  style: AppTextStyle.s15.copyWith(
                    fontWeight: FontWeight.w400,
                    color: isDark ? Color(0xffFEFEFE) : AppColors.grey,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutes.signin);
                  },
                  child: Text(
                    'Signin',
                    style: AppTextStyle.s15.copyWith(
                      color: context.primaryTextColor,
                    ),
                  ),
                ),
              ],
            ),

            AppGap.h25,

            SizedBox(
              child: PrimaryButton(
                text: 'Create an Account',
                color: context.primaryColor,
                onClick: () {
                  Navigator.pushNamed(context, AppRoutes.signup);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          AppGap.h15,

          // Title
          CustomTitle(text: 'Let\'s Get Started'),

          AppGap.h185,

          // Facebook Button
          SizedBox(
            child: SocialLoginButton(
              icon: SvgPicture.asset(
                'assets/icons/platforms/Facebook.svg',
                width: 20,
                height: 20,
              ),
              text: 'Facebook',
              color: AppColors.facebook,
              onTap: () {
                // Handle Facebook login
              },
            ),
          ),

          AppGap.h10,

          // Twitter Button
          SizedBox(
            child: SocialLoginButton(
              icon: SvgPicture.asset(
                'assets/icons/platforms/Twitter.svg',
                width: 20,
                height: 20,
              ),
              text: 'Twitter',
              color: AppColors.twitter,
              onTap: () {
                // Handle Twitter login
              },
            ),
          ),

          AppGap.h10,

          // Google Button
          SizedBox(
            child: SocialLoginButton(
              icon: SvgPicture.asset(
                'assets/icons/platforms/Google.svg',
                width: 20,
                height: 20,
              ),
              text: 'Google',
              color: AppColors.google,
              onTap: () {
                // Handle Google login
              },
            ),
          ),
        ],
      ),
    );
  }
}
