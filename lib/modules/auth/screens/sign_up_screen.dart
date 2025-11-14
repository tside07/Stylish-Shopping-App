import 'package:flutter/material.dart';
import 'package:stylish_shopping_app/core/constants/resources.dart';
import 'package:stylish_shopping_app/core/theme/app_input_decoration.dart';
import 'package:stylish_shopping_app/core/theme/app_text_style.dart';
import 'package:stylish_shopping_app/core/widgets/app_gap.dart';
import 'package:stylish_shopping_app/widgets/primary_button.dart';
import 'package:stylish_shopping_app/widgets/save_switch.dart';
import '../../../utils/routes.dart';
import '../../../widgets/custom_app_bar.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  bool _rememberMe = false;
  bool _isUsernameValid = false;
  bool _isEmailValid = false;
  bool _isPasswordValid = false;

  @override
  void initState() {
    super.initState();
    _usernameController.addListener(() {
      setState(() {
        _isUsernameValid = _usernameController.text.isNotEmpty;
      });
    });
    _passwordController.addListener(() {
      setState(() {
        _isPasswordValid = _passwordController.text.isNotEmpty;
      });
    });
    _emailController.addListener(() {
      setState(() {
        _isEmailValid = _emailController.text.contains('@');
      });
    });
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
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
          appBar: CustomAppBar(
            leading: AppBarIconButton(
              onPressed: () => Navigator.pop(context),
              svgPath: IconPath.arrowLeft,
            ),
          ),
          body: Column(
            children: [
              Expanded(
                child: _Body(
                  usernameController: _usernameController,
                  passwordController: _passwordController,
                  emailController: _emailController,
                  isUsernameValid: _isUsernameValid,
                  isEmailValid: _isEmailValid,
                  isPasswordValid: _isPasswordValid,
                  rememberMe: _rememberMe,
                  onRememberMeChanged: (value) =>
                      setState(() => _rememberMe = value),
                ),
              ),

              // Sign Up Button
              SizedBox(
                child: PrimaryButton(
                  text: 'Sign Up',
                  color: Color(0xff9775FA),
                  onClick: () {
                    Navigator.pushNamed(context, AppRoutes.selectGender);
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
  final TextEditingController usernameController;
  final TextEditingController passwordController;
  final TextEditingController emailController;
  final bool isUsernameValid;
  final bool isEmailValid;
  final bool isPasswordValid;
  final bool rememberMe;
  final ValueChanged<bool> onRememberMeChanged;

  const _Body({
    required this.usernameController,
    required this.passwordController,
    required this.emailController,
    required this.isUsernameValid,
    required this.isEmailValid,
    required this.isPasswordValid,
    required this.rememberMe,
    required this.onRememberMeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppGap.h15,

          // Title
          Center(
            child: Text(
              'Sign Up',
              style: AppTextStyle.base.copyWith(
                color: Color(0xff1D1E20),
                fontSize: 28,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          AppGap.h152,

          // Username
          TextField(
            controller: usernameController,
            keyboardType: TextInputType.text,
            style: AppTextStyle.s15.copyWith(fontWeight: FontWeight.w500),
            decoration: AppInputDecoration.underline.copyWith(
              labelText: 'Username',
              labelStyle: AppTextStyle.s15.copyWith(),
              floatingLabelStyle: AppTextStyle.s13.copyWith(),
              suffixIcon: isUsernameValid
                  ? const Icon(Icons.check, color: Color(0xff34C358), size: 20)
                  : null,
            ),
          ),

          AppGap.h20,

          // Password
          TextField(
            controller: passwordController,
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
            decoration: AppInputDecoration.underline.copyWith(
              labelText: 'Password',
              labelStyle: AppTextStyle.s15.copyWith(),
              floatingLabelStyle: AppTextStyle.s13.copyWith(),
              suffixIcon: isPasswordValid
                  ? const Icon(Icons.check, color: Color(0xff34C358), size: 20)
                  : null,
            ),
          ),

          AppGap.h20,

          // Email
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

          AppGap.h40,

          // Remember me
          SaveSwitch(
            text: 'Remember me',
            save: rememberMe,
            onSaveChanged: onRememberMeChanged,
          ),
        ],
      ),
    );
  }
}
