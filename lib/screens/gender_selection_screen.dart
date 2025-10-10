import 'package:flutter/material.dart';
import 'package:stylish_shopping_app/screens/main_screen.dart';
import '../core/theme/app_text_style.dart';

class GenderSelectionScreen extends StatefulWidget {
  const GenderSelectionScreen({super.key});

  @override
  State<GenderSelectionScreen> createState() => _GenderSelectionScreenState();
}

class _GenderSelectionScreenState extends State<GenderSelectionScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: const Color(0xff9775FA),
        appBar: AppBar(
          backgroundColor: const Color(0xff9775FA),
          elevation: 0,
          automaticallyImplyLeading: false,
        ),
        body: Column(children: [Expanded(child: _Body())]),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 35),

        // Image
        Image.asset(
          'assets/images/logo_man_n_woman.png',
          width: 382,
          height: 430,
          fit: BoxFit.contain,
        ),

        const Spacer(),

        Padding(
          padding: const EdgeInsets.all(15),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                // Title
                const SizedBox(height: 25),

                Text(
                  'Look Good, Feel Good',
                  textAlign: TextAlign.center,
                  style: AppTextStyle.base.copyWith(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    height: 28 / 25,
                    color: const Color(0xff1D1E20),
                  ),
                ),

                const SizedBox(height: 10),

                // Description
                Text(
                  'Create your individual & unique style and\nlook amazing everyday.',
                  textAlign: TextAlign.center,
                  style: AppTextStyle.s15.copyWith(
                    fontWeight: FontWeight.w400,
                    height: 21 / 15,
                    color: const Color(0xff8F959E),
                  ),
                ),

                const SizedBox(height: 20),

                // Gender buttons
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MainScreen(),
                            ),
                            (route) => false,
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 20.5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          elevation: 0,
                        ),
                        child: Text(
                          'Women',
                          style: AppTextStyle.s17.copyWith(
                            color: const Color(0xff8F959E),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),

                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MainScreen(),
                            ),
                            (route) => false,
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 20.5),
                          backgroundColor: const Color(0xff9775FA),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          elevation: 0,
                        ),
                        child: Text(
                          'Men',
                          style: AppTextStyle.s17.copyWith(
                            color: Color(0xffFFFFFF),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // Skip button
                TextButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MainScreen(),
                      ),
                      (route) => false,
                    );
                  },
                  child: Text(
                    'Skip',
                    style: AppTextStyle.s17.copyWith(
                      color: const Color(0xff8F959E),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
