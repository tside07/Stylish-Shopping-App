import 'package:flutter/material.dart';
import 'package:stylish_shopping_app/core/theme/app_text_style.dart';
import 'package:stylish_shopping_app/widgets/primary_button.dart';

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
        
              const SizedBox(height: 25),
        
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
          const SizedBox(height: 15),

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

          const SizedBox(height: 186),

          // New Password Field
          TextField(
            controller: newPasswordController,
            keyboardType: TextInputType.visiblePassword,
            decoration: InputDecoration(
              labelText: 'Password',
              labelStyle: AppTextStyle.s13.copyWith(),
            ),
          ),

          const SizedBox(height: 20),

          // Confirm Password Field
          TextField(
            controller: confirmPasswordController,
            keyboardType: TextInputType.visiblePassword,
            decoration: InputDecoration(
              labelText: 'Confirm Password',
              labelStyle: AppTextStyle.s13.copyWith(),
            ),
          ),

          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
