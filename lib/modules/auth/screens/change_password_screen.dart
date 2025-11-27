import 'package:flutter/material.dart';
import 'package:stylish_shopping_app/core/constants/resources.dart';
import 'package:stylish_shopping_app/core/extensions/theme_extension.dart';
import 'package:stylish_shopping_app/core/theme/app_text_style.dart';
import 'package:stylish_shopping_app/core/widgets/app_gap.dart';
import 'package:stylish_shopping_app/widgets/primary_button.dart';
import 'package:stylish_shopping_app/core/theme/app_input_decoration.dart';
import '../../../widgets/custom_app_bar.dart';

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

              AppGap.h25,

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
          AppGap.h15,

          Center(
            child: Text(
              'Change Password',
              style: AppTextStyle.base.copyWith(
                fontSize: 28,
                fontWeight: FontWeight.w600,
                height: 31 / 28,
                color: context.primaryTextColor,
              ),
            ),
          ),
          AppGap.h80,

          TextField(
            controller: oldPasswordController,
            keyboardType: TextInputType.visiblePassword,
            decoration: AppInputDecoration.underline.copyWith(
              labelText: 'Old Password',
              labelStyle: AppTextStyle.s15.copyWith(),
              floatingLabelStyle: AppTextStyle.s13.copyWith(),
            ),
          ),
          AppGap.h20,

          TextField(
            controller: newPasswordController,
            keyboardType: TextInputType.visiblePassword,
            decoration: AppInputDecoration.underline.copyWith(
              labelText: 'New Password',
              labelStyle: AppTextStyle.s15.copyWith(),
              floatingLabelStyle: AppTextStyle.s13.copyWith(),
            ),
          ),
          AppGap.h20,

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
