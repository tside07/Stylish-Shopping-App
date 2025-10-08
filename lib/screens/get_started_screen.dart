import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stylish_shopping_app/core/theme/app_text_style.dart';
import 'package:stylish_shopping_app/widgets/primary_button.dart';
import '../utils/colors.dart';
import '../utils/routes.dart';
import '../widgets/social_login_button.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          backgroundColor: AppColors.white,
          elevation: 0,
          //   leading: IconButton(
          //     icon: const Icon(Icons.arrow_back, color: AppColors.black),
          //     onPressed: () => Navigator.pop(context),
          //   ),
        ),
        body: Column(
          children: [
            Expanded(
              child: const _Body(),
              //TODO : Split this and name is Body for other screens
            ),

            // Already have an account
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account? ',
                  style: AppTextStyle.s15.copyWith(color: Colors.grey),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutes.signin);
                  },
                  child: Text(
                    'Signin',
                    style: AppTextStyle.s15.copyWith(color: Colors.black),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 25),

            SizedBox(
              child: PrimaryButton(
                text: 'Create an Account',
                color: Color(0xff9775FA),
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
          const SizedBox(height: 15),

          // Title
          Text(
            "Let's Get Started",
            style: AppTextStyle.base.copyWith(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: AppColors.black,
            ),
          ),

          const SizedBox(height: 185),

          // Facebook Button
          SizedBox(
            child: SocialLoginButton(
              icon: SvgPicture.asset(
                'assets/icons/Facebook.svg',
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

          const SizedBox(height: 10),

          // Twitter Button
          SizedBox(
            child: SocialLoginButton(
              icon: SvgPicture.asset(
                'assets/icons/Twitter.svg',
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

          const SizedBox(height: 10),

          // Google Button
          SizedBox(
            child: SocialLoginButton(
              icon: SvgPicture.asset(
                'assets/icons/Google.svg',
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
