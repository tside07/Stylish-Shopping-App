import 'package:flutter/material.dart';
import 'package:stylish_shopping_app/core/theme/app_input_decoration.dart';
import 'package:stylish_shopping_app/core/theme/app_text_style.dart';

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

  @override
  void initState() {
    super.initState();
    _usernameController.addListener(() {
      setState(() {
        _isUsernameValid = _usernameController.text.isNotEmpty;
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
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Navigator.pop(context),
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
                  rememberMe: _rememberMe,
                  onRememberMeChanged: (value) =>
                      setState(() => _rememberMe = value),
                ),
              ),

              // Sign Up Button
              SizedBox(
                width: double.infinity,
                height: 75,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff9775FA),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    'Sign Up',
                    style: AppTextStyle.s17.copyWith(
                      color: Color(0xffFEFEFE),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
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
  final bool rememberMe;
  final ValueChanged<bool> onRememberMeChanged;

  const _Body({
    super.key,
    required this.usernameController,
    required this.passwordController,
    required this.emailController,
    required this.isUsernameValid,
    required this.isEmailValid,
    required this.rememberMe,
    required this.onRememberMeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 15),

          // Title
          Center(
            child: Text(
              'Sign Up',
              style: AppTextStyle.base.copyWith(
                fontSize: 28,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          const SizedBox(height: 152),

          // Username
          TextField(
            controller: usernameController,
            style: AppTextStyle.s15.copyWith(fontWeight: FontWeight.w500),
            decoration: AppInputDecoration.underline.copyWith(
              labelText: 'Username',
              labelStyle: AppTextStyle.s15.copyWith(),
              floatingLabelStyle: AppTextStyle.s13
                  .copyWith(), //TODO: Add floatingLabelStyle
              suffixIcon: isUsernameValid
                  ? const Icon(Icons.check, color: Colors.green, size: 20)
                  : null,
            ),
          ),

          const SizedBox(height: 20),

          // Password
          TextField(
            controller: passwordController,
            obscureText: true,
            decoration: AppInputDecoration.underline.copyWith(
              labelText: 'Password',
              labelStyle: AppTextStyle.s13.copyWith(),
              floatingLabelStyle: AppTextStyle.s13.copyWith(),
            ),
          ),

          const SizedBox(height: 20),

          // Email
          TextField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: AppInputDecoration.underline.copyWith(
              labelText: 'Email Address',
              labelStyle: AppTextStyle.s13.copyWith(),
              suffixIcon: isEmailValid
                  ? const Icon(Icons.check, color: Colors.green, size: 20)
                  : null,
            ),
          ),

          const SizedBox(height: 40),

          // Remember me
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Remember me',
                style: TextStyle(
                  fontFamily: 'Manrope',
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
              Switch(
                value: rememberMe,
                activeThumbColor: Colors.green,
                onChanged: onRememberMeChanged,
              ),
            ],
          ),

          const SizedBox(height: 168),
        ],
      ),
    );
  }
}
