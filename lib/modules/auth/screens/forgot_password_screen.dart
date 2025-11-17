import 'package:flutter/material.dart';
import 'package:stylish_shopping_app/core/constants/resources.dart';
import 'package:stylish_shopping_app/core/extensions/theme_extension.dart';
import 'package:stylish_shopping_app/core/theme/app_text_style.dart';
import 'package:stylish_shopping_app/core/theme/app_input_decoration.dart';
import 'package:stylish_shopping_app/core/widgets/app_gap.dart';
import 'package:stylish_shopping_app/widgets/custom_title.dart';
import 'package:stylish_shopping_app/widgets/primary_button.dart';
import '../../../utils/routes.dart';
import '../../../widgets/custom_app_bar.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
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
          backgroundColor: context.backgroundColor,
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

              AppGap.h25,

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
          AppGap.h15,

          // Title
          Center(child: CustomTitle(text: 'Forgot Password')),

          AppGap.h68,

          // Image
          Image.asset(
            Images.logoLockedcloud,
            width: 320,
            height: 236,
            fit: BoxFit.cover,
          ),

          AppGap.h80,

          // Email Input Field
          TextField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: AppInputDecoration.underline.copyWith(
              labelText: 'Email Address',
              labelStyle: AppTextStyle.s15.copyWith(),
              floatingLabelStyle: AppTextStyle.s13.copyWith(
                color: context.primaryTextColor,
              ),
              suffixIcon: isEmailValid
                  ? const Icon(Icons.check, color: Color(0xff34C358), size: 20)
                  : null,
            ),
          ),

          AppGap.h165,
        ],
      ),
    );
  }
}
