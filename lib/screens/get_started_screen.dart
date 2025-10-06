import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stylish_shopping_app/core/theme/app_text_style.dart';
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

            SizedBox(
              width: double.infinity,
              height: 75,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.signup);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(151, 117, 250, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  'Create an Account',
                  style: AppTextStyle.s17.copyWith(
                    color: AppColors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          const SizedBox(height: 20),

          // Title
          Text(
            "Let's Get Started",
            style: AppTextStyle.base.copyWith(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: AppColors.black,
            ),
          ),

          const SizedBox(height: 80),

          // Facebook Button
          SocialLoginButton(
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

          const SizedBox(height: 15),

          // Twitter Button
          SocialLoginButton(
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

          const SizedBox(height: 15),

          // Google Button
          SocialLoginButton(
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

          const Spacer(),

          // Already have an account
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Already have an account? ',
                style: AppTextStyle.base.copyWith(
                  color: AppColors.grey,
                  fontSize: 14,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.signin);
                },
                child: Text(
                  'Signin',
                  style: AppTextStyle.base.copyWith(
                    fontFamily: 'Inter',
                    color: AppColors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

