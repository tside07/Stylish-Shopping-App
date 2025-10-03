import 'package:flutter/material.dart';

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
                  // Title
                  const Center(
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 28, 
                        fontWeight: FontWeight.w600),
                    ),
                  ),

                  const SizedBox(height: 100),

                  // Username
                  TextField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      labelText: 'Username',
                      labelStyle: const TextStyle(fontFamily: 'Inter', fontSize: 13),
                      hintText: 'Enter your username',
                      hintStyle: const TextStyle(fontFamily: 'Inter', color: Colors.black87, fontSize: 15),
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
                  TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(fontFamily: 'Inter', fontSize: 13),
                      hintText: 'Enter your password',
                      hintStyle: TextStyle(
                        fontFamily: 'Inter',
                        color: Colors.black87,
                        fontSize: 15,
                        ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 0.5),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.green, width: 1),
                      ),
                    ),
                  ),

                  const SizedBox(height: 35),

                  // Email
                  TextField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Email Address',
                      labelStyle: const TextStyle(fontFamily: 'Inter', fontSize: 13),
                      hintText: 'Enter the email address',
                      hintStyle: const TextStyle(fontFamily: 'Inter', color: Colors.black87, fontSize: 15),
                      suffixIcon: _isEmailValid
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

                  const SizedBox(height: 30),

                  // Remember me
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Remember me',
                        style: TextStyle(fontFamily: 'Manrope',fontSize: 14, color: Colors.black),
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
            height: 75,
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
    _emailController.dispose();
    super.dispose();
  }
}
