import 'package:flutter/material.dart';
import '../utils/colors.dart';
import '../utils/routes.dart';
import '../widgets/social_login_button.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  const SizedBox(height: 20),

                  // Title
                  const Text(
                    "Let's Get Started",
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                    ),
                  ),

                  const SizedBox(height: 80),

                  // Facebook Button
                  SocialLoginButton(
                    icon: Icons.facebook,
                    text: 'Facebook',
                    color: AppColors.facebook,
                    onTap: () {
                      // Handle Facebook login
                      print('Facebook login tapped');
                    },
                  ),

                  const SizedBox(height: 15),

                  // Twitter Button
                  SocialLoginButton(
                    icon: Icons.flutter_dash,
                    text: 'Twitter',
                    color: AppColors.twitter,
                    onTap: () {
                      // Handle Twitter login
                      print('Twitter login tapped');
                    },
                  ),

                  const SizedBox(height: 15),

                  // Google Button
                  SocialLoginButton(
                    text: 'Google',
                    color: AppColors.google,
                    isGoogle: true,
                    onTap: () {
                      // Handle Google login
                      print('Google login tapped');
                    },
                  ),

                  const Spacer(),

                  // Already have an account
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Already have an account? ',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          color: AppColors.grey,
                          fontSize: 14
                          ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, AppRoutes.signin);
                        },
                        child: const Text(
                          'Signin',
                          style: TextStyle(
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
            ),
          ),

          SizedBox(
            width: double.infinity,
            height: 75,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.signup);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
                elevation: 0,
              ),
              child: const Text(
                'Create an Account',
                style: TextStyle(
                  fontFamily: 'Inter',
                  color: AppColors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
