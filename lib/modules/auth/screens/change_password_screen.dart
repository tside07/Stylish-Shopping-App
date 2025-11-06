import 'package:flutter/material.dart';
import 'package:stylish_shopping_app/core/theme/app_text_style.dart';
import 'package:stylish_shopping_app/widgets/primary_button.dart';
import 'package:stylish_shopping_app/core/theme/app_input_decoration.dart';
import '../../../widgets/custom_app_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final _oldPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmNewPwController = TextEditingController();

  @override
  void dispose() {
    _oldPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmNewPwController.dispose();
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
                  oldPasswordController: _oldPasswordController,
                  newPasswordController: _newPasswordController,
                  confirmNewPwController: _confirmNewPwController,
                ),
              ),

              Text(
                'Please write your new password.',
                textAlign: TextAlign.center,
                style: AppTextStyle.s13.copyWith(color: Color(0xff8F959E)),
              ),

              const SizedBox(height: 25),

              SizedBox(
                child: PrimaryButton(
                  text: 'Reset Password',
                  color: Color(0xff9775FA),
                  onClick: () {
                    Navigator.pop(context);
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
  final TextEditingController oldPasswordController;
  final TextEditingController newPasswordController;
  final TextEditingController confirmNewPwController;

  const _Body({
    required this.oldPasswordController,
    required this.newPasswordController,
    required this.confirmNewPwController,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(height: 15),

          Center(
            child: Text(
              'Change Password',
              style: AppTextStyle.base.copyWith(
                fontSize: 28,
                fontWeight: FontWeight.w600,
                height: 31 / 28,
                color: const Color(0xff1D1E20),
              ),
            ),
          ),
          const SizedBox(height: 80),

          TextField(
            controller: oldPasswordController,
            keyboardType: TextInputType.visiblePassword,
            decoration: AppInputDecoration.underline.copyWith(
              labelText: 'Old Password',
              labelStyle: AppTextStyle.s15.copyWith(),
              floatingLabelStyle: AppTextStyle.s13.copyWith(),
            ),
          ),
          const SizedBox(height: 20),

          TextField(
            controller: newPasswordController,
            keyboardType: TextInputType.visiblePassword,
            decoration: AppInputDecoration.underline.copyWith(
              labelText: 'New Password',
              labelStyle: AppTextStyle.s15.copyWith(),
              floatingLabelStyle: AppTextStyle.s13.copyWith(),
            ),
          ),
          const SizedBox(height: 20),

          TextField(
            controller: confirmNewPwController,
            keyboardType: TextInputType.visiblePassword,
            decoration: AppInputDecoration.underline.copyWith(
              labelText: 'Confirm New Password',
              labelStyle: AppTextStyle.s15.copyWith(),
              floatingLabelStyle: AppTextStyle.s13.copyWith(),
            ),
          ),
        ],
      ),
    );
  }
}
