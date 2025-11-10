import 'package:flutter/material.dart';
import '../modules/auth/screens/splash_screen.dart';
import '../modules/auth/screens/get_started_screen.dart';
import '../modules/auth/screens/sign_up_screen.dart';
import '../modules/auth/screens/sign_in_screen.dart';
import '../modules/auth/screens/forget_password_screen.dart';
import '../modules/auth/screens/verification_code_screen.dart';
import '../screens/create_new_password_screen.dart';
import '../modules/gender_selection/screens/gender_selection_screen.dart';
import '../modules/home/screens/home_screen.dart';
import '../modules/delivery_address/screens/delivery_address_screen.dart';
import '../modules/payment_method/screens/payment_method_screen.dart';
import '../modules/add_card/screens/add_new_card_screen.dart';
import '../screens/order_success_screen.dart';
import '../modules/view_review/screens/view_review_screen.dart';
import '../modules/add_review/screens/add_review_screen.dart';
import '../modules/auth/screens/change_password_screen.dart';
import '../modules/cart/screens/cart_screen.dart'; // Đổi import

class AppRoutes {
  static const String splash = '/';
  static const String getStarted = '/get-started';
  static const String signin = '/signin';
  static const String signup = '/signup';
  static const String forgetPw = '/forget-password';
  static const String verificationCode = '/verification-code';
  static const String createNewPw = '/create-new-password';
  static const String selectGender = '/select-gender';
  static const String homepage = '/homepage-screen';
  static const String cart = '/cart-screen';
  static const String address = '/address';
  static const String payment = '/payment';
  static const String addCard = '/addCard';
  static const String orderSuccess = '/orderSuccess';
  static const String viewReview = '/viewReview';
  static const String addReview = '/addReview';
  static const String changePw = '/changePw';

  static Map<String, WidgetBuilder> routes = {
    splash: (context) => const SplashScreen(),
    getStarted: (context) => const GetStartedScreen(),
    signin: (context) => const SignInScreen(),
    signup: (context) => const SignUpScreen(),
    forgetPw: (context) => const ForgetPasswordScreen(),
    verificationCode: (context) => const VerificationCodeScreen(),
    createNewPw: (context) => const CreateNewPasswordScreen(),
    selectGender: (context) => const GenderSelectionScreen(),
    homepage: (context) => const HomeScreen(),
    cart: (context) => const CartScreen(isInHub: false),
    address: (context) => const DeliveryAddressScreen(),
    payment: (context) => const PaymentMethodScreen(),
    addCard: (context) => const AddNewCardScreen(),
    orderSuccess: (context) => const OrderSuccessScreen(),
    viewReview: (context) => const ViewReviewScreen(),
    addReview: (context) => const AddReviewScreen(),
    changePw: (context) => const ChangePasswordScreen(),
  };
}
