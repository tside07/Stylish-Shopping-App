import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stylish_shopping_app/core/constants/resources.dart';
import 'package:stylish_shopping_app/core/extensions/theme_extension.dart';
import 'package:stylish_shopping_app/core/theme/theme_provider.dart';
import 'package:stylish_shopping_app/core/widgets/app_gap.dart';
import 'package:stylish_shopping_app/modules/gender_selection/widgets/gender_selection_widget.dart';
import 'dart:ui' as ui;

class GenderSelectionScreen extends StatelessWidget {
  const GenderSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.genderSelectionBackgroundColor,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Align(
            alignment: Alignment(-1.3, -1.1),
            child: ImageFiltered(
              imageFilter: ui.ImageFilter.blur(sigmaX: 120, sigmaY: 120),
              child: Opacity(
                opacity: 0.8,
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

          Align(
            alignment: Alignment(-1.5, 0),
            child: ImageFiltered(
              imageFilter: ui.ImageFilter.blur(sigmaX: 120, sigmaY: 120),
              child: Opacity(
                opacity: 0.8,
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

          Align(
            alignment: Alignment(1, 0.6),
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
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDark = themeProvider.isDarkMode;
    
    return Column(
      children: [
        AppGap.h140,

        // Image
        Image.asset(
          Images.logoManNWoman,
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
              color: isDark ? const Color(0xff29363D) : const Color(0xffFFFFFF) ,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                // Title
                AppGap.h25,

                Header(
                  title: 'Look Good, Feel Good',
                  description:
                      'Create your individual & unique style and look amazing everyday.',
                ),

                AppGap.h20,

                // Gender buttons
                GenderButton(),
                AppGap.h20,

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
