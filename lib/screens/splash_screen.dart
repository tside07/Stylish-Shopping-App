import 'package:flutter/material.dart';
import 'package:stylish_shopping_app/screens/get_started_screen.dart';
import '../utils/colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
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

              const Text(
                'STYLISH',
                style: TextStyle(
                  fontFamily: 'FiraSans',
                  fontSize: 50,
                  fontWeight: FontWeight.normal,
                  color: Colors.white,
                  letterSpacing: 2,
                ),
              ),

              const Text(
                'Find Your Style',
                style: TextStyle(
                  fontFamily: 'Sacramento',
                  fontSize: 40,
                  
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
              ),

              const Spacer(flex: 2),

              // Arrow button to next screen
              IconButton(
                onPressed: () {
                  Navigator.push(
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
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.arrow_forward,
                    color: Colors.black,
                    size: 30,
                  ),
                ),
              ),

              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
