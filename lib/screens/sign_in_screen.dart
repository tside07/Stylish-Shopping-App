import 'dart:collection';

import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignInScreen> {
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
  Widget build(BuildContext context) {
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),

                  // Title
                  const Center(
                    child: Text(
                      'Welcome',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),

                  Center(
                    child: const Text(
                        'Please enter your data to continue',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 15,
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                        )),
                  ),

                  const SizedBox(height: 100),

                  // Username
                  const Text(
                    'Username',
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  TextField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      hintText: 'Enter your username',
                      hintStyle: const TextStyle(color: Colors.black87),
                      suffixIcon: _isUsernameValid
                          ? const Icon(
                              Icons.check,
                              color: Colors.green,
                              size: 20,
                            )
                          : null,
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 0.5),
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.green, width: 1),
                      ),
                    ),
                  ),

                  const SizedBox(height: 35),

                  // Password
                  const Text(
                    'Password',
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: 'Enter your password',
                      hintStyle: TextStyle(color: Colors.black87),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 0.5),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.green, width: 1),
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),


                  //Forgot Password
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/forget-password');
                      },
                      child: const Text(
                        'Forgot Password?',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 15,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  // Remember me
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Remember me',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                      Switch(
                        value: _rememberMe,
                        activeThumbColor: Colors.green,
                        onChanged: (val) {
                          setState(() {
                            _rememberMe = val;
                          });
                        },
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),

          // Sign Up Button
          SizedBox(
            width: double.infinity,
            height: 55,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF8B5CF6),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
                elevation: 0,
              ),
              child: const Text(
                'Sign Up',
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

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
