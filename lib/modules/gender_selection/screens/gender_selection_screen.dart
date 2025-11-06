import 'package:flutter/material.dart';
import 'package:stylish_shopping_app/modules/gender_selection/widgets/gender_selection_widget.dart';
import 'dart:ui' as ui;

class GenderSelectionScreen extends StatelessWidget {
  const GenderSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color(0xff9775FA),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            top: -81,
            left: -42,
            child: ImageFiltered(
              imageFilter: ui.ImageFilter.blur(sigmaX: 120, sigmaY: 120),
              child: Opacity(
                opacity: 0.6,
                child: Container(
                  width: 250,
                  height: 250,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [Colors.white, Colors.white.withValues(alpha: 0)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
              ),
            ),
          ),

          Positioned(
            top: 381,
            left: -74,
            child: ImageFiltered(
              imageFilter: ui.ImageFilter.blur(sigmaX: 120, sigmaY: 120),
              child: Opacity(
                opacity: 0.6,
                child: Container(
                  width: 148,
                  height: 148,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [Colors.white, Colors.white.withValues(alpha: 0)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
              ),
            ),
          ),

          Positioned(
            top: 503,
            left: 194,
            child: ImageFiltered(
              imageFilter: ui.ImageFilter.blur(sigmaX: 120, sigmaY: 120),
              child: Opacity(
                opacity: 0.6,
                child: Container(
                  width: 250,
                  height: 250,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [Colors.white, Colors.white.withValues(alpha: 0)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
              ),
            ),
          ),

          _Body(),
        ],
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
        const SizedBox(height: 140),

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

                Header(
                  title: 'Look Good, Feed Good',
                  description:
                      'Create your individual & unique style and look amazing everyday.',
                ),

                const SizedBox(height: 20),

                // Gender buttons
                GenderButton(),
                const SizedBox(height: 20),

                // Skip button
                SkipButton(),
              ],
            ),
          ),
        ),
        SafeArea(top: false, child: SizedBox()),
      ],
    );
  }
}

