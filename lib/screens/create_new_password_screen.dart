import 'package:flutter/material.dart';
import 'package:stylish_shopping_app/core/theme/app_text_style.dart';
import 'package:stylish_shopping_app/core/widgets/app_gap.dart';
import 'package:stylish_shopping_app/widgets/primary_button.dart';
import '../widgets/custom_app_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stylish_shopping_app/core/theme/app_input_decoration.dart';

class CreateNewPasswordScreen extends StatefulWidget {
  const CreateNewPasswordScreen({super.key});

  @override
  State<CreateNewPasswordScreen> createState() => _CreateNewPasswordState();
}

class _CreateNewPasswordState extends State<CreateNewPasswordScreen> {
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _isNewPasswordValid = false;
  bool _isConfirmPasswordValid = false;

  @override
  void initState() {
    super.initState();
    _newPasswordController.addListener(() {
      setState(() {
        _isNewPasswordValid = _newPasswordController.text.isNotEmpty;
      });
    });
    _confirmPasswordController.addListener(() {
      setState(() {
        _isConfirmPasswordValid =
            _confirmPasswordController.text == _newPasswordController.text;
      });
    });
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
            leading: IconButton(
              icon: SvgPicture.asset('assets/icons/app_icons/Arrow_Left.svg'),
              onPressed: () => Navigator.pop(context),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
            ),
          ),
          body: Column(
            children: [
              Expanded(
                child: _Body(
                  newPasswordController: _newPasswordController,
                  confirmPasswordController: _confirmPasswordController,
                  isNewPasswordValid: _isNewPasswordValid,
                  isConfirmPasswordValid: _isConfirmPasswordValid,
                ),
              ),

              // Text
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Please write your new password.',
                  textAlign: TextAlign.center,
                  style: AppTextStyle.s13.copyWith(
                    color: const Color(0xff8F959E),
                    height: 18 / 13,
                  ),
                ),
              ),

              AppGap.h25,

              // Button
              SizedBox(
                child: PrimaryButton(
                  text: 'Reset password',
                  color: Color(0xff9775FA),
                  onClick: () {
                    // Handle sign up action
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
  final TextEditingController newPasswordController;
  final TextEditingController confirmPasswordController;
  final bool isNewPasswordValid;
  final bool isConfirmPasswordValid;

  const _Body({
    required this.newPasswordController,
    required this.confirmPasswordController,
    required this.isNewPasswordValid,
    required this.isConfirmPasswordValid,
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
              'New Password',
              style: AppTextStyle.base.copyWith(
                fontSize: 28,
                fontWeight: FontWeight.w600,
                height: 31 / 28,
              ),
            ),
          ),

          AppGap.h185,

          // New Password Field
          TextField(
            controller: newPasswordController,
            keyboardType: TextInputType.visiblePassword,
            decoration: AppInputDecoration.underline.copyWith(
              labelText: 'Password',
              labelStyle: AppTextStyle.s13.copyWith(),
            ),
          ),

          AppGap.h20,

          // Confirm Password Field
          TextField(
            controller: confirmPasswordController,
            keyboardType: TextInputType.visiblePassword,
            decoration: AppInputDecoration.underline.copyWith(
              labelText: 'Confirm Password',
              labelStyle: AppTextStyle.s13.copyWith(),
            ),
          ),
        ],
      ),
    );
  }
}
