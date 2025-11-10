import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:stylish_shopping_app/core/constants/resources.dart';
import 'dart:async';
import 'package:stylish_shopping_app/core/theme/app_text_style.dart';
import 'package:stylish_shopping_app/core/widgets/app_gap.dart';
import 'package:stylish_shopping_app/widgets/primary_button.dart';
import '../../../utils/routes.dart';
import '../../../widgets/custom_app_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';

class VerificationCodeScreen extends StatefulWidget {
  const VerificationCodeScreen({super.key});

  @override
  State<VerificationCodeScreen> createState() => _VerificationCodeScreenState();
}

class _VerificationCodeScreenState extends State<VerificationCodeScreen> {
  late Timer timer;
  Duration duration = const Duration(seconds: 20);
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final String validPin = "1234";

  final defaultPinTheme = PinTheme(
    width: 77,
    height: 98,
    textStyle: AppTextStyle.base.copyWith(
      fontSize: 20,
      color: Color(0xff1D1E20),
      fontWeight: FontWeight.w600,
    ),
    decoration: BoxDecoration(
      border: Border.all(color: Color(0xffE7E8EA)),
      borderRadius: BorderRadius.circular(10),
    ),
  );

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (duration.inSeconds == 0) {
        timer.cancel();
        return;
      }
      setState(() {
        duration = Duration(seconds: duration.inSeconds - 1);
      });
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  String getFormattedTime(int time) {
    return time < 10 ? '0$time' : '$time';
  }

  @override
  Widget build(BuildContext context) {
    final minutes = getFormattedTime(duration.inMinutes);
    final seconds = getFormattedTime(duration.inSeconds.remainder(60));
    final isTimeUp = duration.inSeconds == 0;

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
                  formKey: formKey,
                  defaultPinTheme: defaultPinTheme,
                  validPin: validPin,
                ),
              ),

              // Resend Code
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: AppTextStyle.s13.copyWith(),
                    children: [
                      if (!isTimeUp)
                        TextSpan(
                          text: '$minutes:$seconds ',
                          style: AppTextStyle.base.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      TextSpan(
                        text: 'resend confirmation code',
                        style: AppTextStyle.base.copyWith(
                          color: isTimeUp ? Colors.black : Colors.grey,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              AppGap.h20,

              // Button
              SizedBox(
                child: PrimaryButton(
                  text: 'Confirm Code',
                  color: Color(0xff9775FA),
                  onClick: () {
                    Navigator.pushNamed(context, AppRoutes.createNewPw);
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
  final GlobalKey<FormState> formKey;
  final PinTheme defaultPinTheme;
  final String validPin;

  const _Body({
    required this.formKey,
    required this.defaultPinTheme,
    required this.validPin,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          AppGap.h15,

          // Title
          Center(
            child: Text(
              'Verification Code',
              style: AppTextStyle.base.copyWith(
                fontSize: 28,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          AppGap.h68,

          // Image
          Image.asset(
            Images.logoLockedcloud,
            width: 225,
            height: 166,
            fit: BoxFit.contain,
          ),

          AppGap.h60,

          // 4 Verification Code Boxes
          Form(
            key: formKey,
            child: Pinput(
              defaultPinTheme: defaultPinTheme,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the code';
                } else if (value != validPin) {
                  return 'Invalid code';
                }
                return null;
              },
            ),
          ),
        ],
      ),
    );
  }
}
