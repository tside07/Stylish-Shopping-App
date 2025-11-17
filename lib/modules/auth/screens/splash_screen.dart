import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stylish_shopping_app/core/theme/theme_provider.dart';
import 'package:stylish_shopping_app/core/widgets/app_gap.dart';
import 'package:stylish_shopping_app/modules/auth/screens/get_started_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDark = themeProvider.isDarkMode;

    return Scaffold(
      backgroundColor: isDark ? const Color(0xff1B262C) : const Color(0xff9775FA),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(flex: 2),

              Image.asset(
                'assets/images/logo_dress.png',
                width: 222,
                height: 222,
                fit: BoxFit.cover,
              ),

              Text(
                'STYLISH',
                style: TextStyle(
                  fontFamily: 'FiraSans',
                  fontSize: 50,
                  fontWeight: FontWeight.normal,
                  color: const Color(0xffFEFEFE),
                  letterSpacing: 2,
                ),
              ),

              Text(
                'Find Your Style',
                style: TextStyle(
                  fontFamily: 'Sacramento',
                  fontSize: 40,
                  color:const Color(0xffFEFEFE),
                  fontWeight: FontWeight.w400,
                ),
              ),

              const Spacer(flex: 2),

              // Arrow button to next screen
              IconButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute<void>(
                      builder: (context) => const GetStartedScreen(),
                    ),
                  );
                },
                icon: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Color(0xffF5F6FA),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.arrow_forward,
                    color: Color(0xff1D1E20),
                    size: 30,
                  ),
                ),
              ),

              AppGap.h50,
            ],
          ),
        ),
      ),
    );
  }
}
