import 'package:flutter/material.dart';
import '../screens/splash_screen.dart';
import '../screens/get_started_screen.dart';
import '../screens/sign_up_screen.dart';
import '../screens/sign_in_screen.dart';
import '../screens/forget_password_screen.dart';
import '../screens/verification_code_screen.dart';
import '../screens/create_new_password_screen.dart';

class AppRoutes {
  static const String splash = '/';
  static const String getStarted = '/get-started';
  static const String signin = '/signin';
  static const String signup = '/signup';
  static const String forgetPw = '/forget-password';
  static const String verificationCode = '/verification-code';
  static const String createNewPw = '/create-new-password';

  static Map<String, WidgetBuilder> routes = {
    splash: (context) => const SplashScreen(),
    getStarted: (context) => const GetStartedScreen(),
    signin: (context) => const SignInScreen(),
    signup: (context) => const SignUpScreen(),
    forgetPw: (context) => const ForgetPasswordScreen(),
    verificationCode: (context) => const VerificationCodeScreen(),
    createNewPw: (context) => const CreateNewPasswordScreen(),
  };
}


