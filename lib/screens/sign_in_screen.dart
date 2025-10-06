import 'package:flutter/material.dart';
import 'package:stylish_shopping_app/core/theme/app_input_decoration.dart';
import 'package:stylish_shopping_app/core/theme/app_text_style.dart';
import '../utils/routes.dart';


class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _rememberMe = false;
  bool _isUsernameValid = false;

  @override
  void initState() {
    super.initState();
    _usernameController.addListener(() {
      setState(() {
        _isUsernameValid = _usernameController.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
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
                    usernameController: _usernameController,
                    passwordController: _passwordController,
                    isUsernameValid: _isUsernameValid,
                    rememberMe: _rememberMe,
                    onRememberMeChanged: (value) =>
                        setState(() => _rememberMe = value),
                  ),
                ),
        
                const SizedBox(height: 107),
        
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: AppTextStyle.s13.copyWith(
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                        height: 18/13,
                      ),
                      children: [
                        TextSpan(
                          text:
                              'By connecting your account confirm that you agree\nwith our ',
                              style: AppTextStyle.s13.copyWith(
                                color: Colors.grey,
                                fontWeight: FontWeight.w400,
                                height: 18/13
                              ),
                        ),
                        TextSpan(
                          text: 'Term and Condition',
                          style: AppTextStyle.s13.copyWith(
                            color: Color(0xff1D1E20),
                            fontWeight: FontWeight.w500,
                            height: 18/13,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
        
                const SizedBox(height: 25),
        
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
                      'Login',
                      style: AppTextStyle.s17.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
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
  final bool isUsernameValid;
  final bool rememberMe;
  final ValueChanged<bool> onRememberMeChanged;

  const _Body({
    super.key,
    required this.usernameController,
    required this.passwordController,
    required this.isUsernameValid,
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

          Center(
            child: Text(
              'Welcome',
              style: AppTextStyle.base.copyWith(
                fontFamily: 'Inter',
                fontSize: 28,
                color: const Color(0xff1D1E20),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          const SizedBox(height: 5),

          Center(
            child: Text(
              'Please enter your data to continue',
              style: AppTextStyle.s15.copyWith(
                color: const Color(0xff8F959E),
                fontWeight: FontWeight.w400,
              ),
            ),
          ),

          const SizedBox(height: 164),

          TextField(
            controller: usernameController,
            keyboardType: TextInputType.text,
            decoration: AppInputDecoration.underline.copyWith(
              labelText: 'Username',
              labelStyle: AppTextStyle.s15.copyWith(
                fontWeight: FontWeight.w400,
              ),
              floatingLabelStyle: AppTextStyle.s13.copyWith(),
              suffixIcon: isUsernameValid
                  ? const Icon(Icons.check, color: Color(0xff34C358), size: 20)
                  : null,
            ),
          ),

          const SizedBox(height: 20),

          TextField(
            controller: passwordController,
            obscureText: true,
            keyboardType: TextInputType.visiblePassword,
            decoration: AppInputDecoration.underline.copyWith(
              labelText: 'Password',
              labelStyle: AppTextStyle.s15.copyWith(
                fontWeight: FontWeight.w400,
              ),
            floatingLabelStyle: AppTextStyle.s13.copyWith(),
            ),
          ),

          const SizedBox(height: 30),

          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.forgetPw);
                },
                child: Text(
                  'Forget password?',
                  style: AppTextStyle.s15.copyWith(
                    color: Color(0xffEA4335),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 40),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Remember me',
                style: TextStyle(
                  fontFamily: 'Manrope',
                  fontSize: 13,
                  color: Color(0xff1D1E20),
                  fontWeight: FontWeight.w500,
                  height: 14 / 13,
                ),
              ),
              Switch(
                value: rememberMe,
                activeThumbColor: Color(0xff34C759),
                onChanged: onRememberMeChanged,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
