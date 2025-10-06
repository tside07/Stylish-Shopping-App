import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'dart:async';

class VerificationCodeScreen extends StatefulWidget {
  const VerificationCodeScreen({super.key});

  @override
  State<VerificationCodeScreen> createState() => _VerificationCodeScreenState();
}

class _VerificationCodeScreenState extends State<VerificationCodeScreen> {
  late Timer timer;
  Duration duration = const Duration(seconds: 20);

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

  final defaultPinTheme = PinTheme(
    width: 77,
    height: 98,
    textStyle: const TextStyle(
      fontFamily: 'Inter',
      fontSize: 20,
      color: Color.fromRGBO(29, 30, 32, 1),
      fontWeight: FontWeight.w600,
    ),
    decoration: BoxDecoration(
      border: Border.all(color: Color.fromRGBO(231, 232, 234, 1)),
      borderRadius: BorderRadius.circular(10),
    ),
  );

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String validPin = "1234";

  @override
  Widget build(BuildContext context) {
    final minutes = getFormattedTime(duration.inMinutes);
    final seconds = getFormattedTime(duration.inSeconds.remainder(60));
    final isTimeUp = duration.inSeconds == 0;

    return Scaffold(
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
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  const SizedBox(height: 10),

                  // Title
                  const Center(
                    child: Text(
                      'Verification Code',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),

                  const SizedBox(height: 50),

                  // Image
                  Image.asset(
                    'assets/images/logo_lockedcloud.png',
                    width: 225,
                    height: 166,
                    fit: BoxFit.contain,
                  ),

                  const SizedBox(height: 50),

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
            ),
          ),

          // Resend Code 
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: const TextStyle(fontSize: 13),
                children: [
                  if (!isTimeUp)
                    TextSpan(
                      text: '$minutes:$seconds ',
                      style: const TextStyle(
                        fontFamily: 'Inter',
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  TextSpan(
                    text: 'resend confirmation code',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      color: isTimeUp ? Colors.black : Colors.grey,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 20),

          // Confirm Code Button
          SizedBox(
            width: double.infinity,
            height: 75,
            child: ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  Navigator.pushNamed(context, '/create-new-password');
                } 
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF8B5CF6),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
                elevation: 0,
              ),
              child: const Text(
                'Confirm Code',
                style: TextStyle(
                  fontFamily: 'Inter',
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
