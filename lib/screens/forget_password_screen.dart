import 'package:flutter/material.dart';
import 'package:stylish_shopping_app/core/theme/app_text_style.dart';
import 'package:stylish_shopping_app/core/theme/app_input_decoration.dart';
import 'package:stylish_shopping_app/widgets/primary_button.dart';
import '../utils/routes.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgetPasswordScreen> {
  final _emailController = TextEditingController();
  bool _isEmailValid = false;

  @override
  void initState() {
    super.initState();
    _emailController.addListener(() {
      setState(() {
        _isEmailValid = _emailController.text.contains('@');
      });
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: SafeArea(
        top: false,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Color(0xff1D1E20)),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          body: Column(
            children: [
              Expanded(
                child: _Body(
                  emailController: _emailController,
                  isEmailValid: _isEmailValid,
                ),
              ),

              // Description Text - Near button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Please write your email to receive a\nconfirmation code to set a new password.',
                  textAlign: TextAlign.center,
                  style: AppTextStyle.s13.copyWith(
                    color: const Color(0xff8F959E),
                    height: 18 / 13,
                  ),
                ),
              ),

              const SizedBox(height: 25),

              // confirm
              SizedBox(
                child: PrimaryButton(
                  text: 'Confirm Mail',
                  color: Color(0xff9775FA),
                  onClick: () {
                    Navigator.pushNamed(context, AppRoutes.verificationCode);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  final TextEditingController emailController;
  final bool isEmailValid;

  const _Body({required this.emailController, required this.isEmailValid});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(height: 15),

          // Title
          Center(
            child: Text(
              'Forgot Password',
              style: AppTextStyle.base.copyWith(
                fontSize: 28,
                fontWeight: FontWeight.w600,
                height: 31 / 28,
                color: const Color(0xff1D1E20),
              ),
            ),
          ),

          const SizedBox(height: 68),

          // Image
          Image.asset(
            'assets/images/logo_lockedcloud.png',
            width: 225,
            height: 166,
            fit: BoxFit.contain,
          ),

          const SizedBox(height: 80),

          // Email Input Field
          TextField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: AppInputDecoration.underline.copyWith(
              labelText: 'Email Address',
              labelStyle: AppTextStyle.s15.copyWith(),
              floatingLabelStyle: AppTextStyle.s13.copyWith(),
              suffixIcon: isEmailValid
                  ? const Icon(Icons.check, color: Color(0xff34C358), size: 20)
                  : null,
            ),
          ),

          const SizedBox(height: 165),
        ],
      ),
    );
  }
}
