import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stylish_shopping_app/core/constants/resources.dart';
import 'package:stylish_shopping_app/core/extensions/theme_extension.dart';
import 'package:stylish_shopping_app/core/theme/app_text_style.dart';
import 'package:stylish_shopping_app/core/widgets/app_gap.dart';
import 'package:stylish_shopping_app/widgets/custom_text_field.dart';

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({super.key});

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  final TextEditingController _startController = TextEditingController();
  final TextEditingController _endController = TextEditingController();

  @override
  void dispose() {
    _startController.dispose();
    _endController.dispose();
    super.dispose();
  }

  String get rangePriceValueText {
    final startValue = _startController.text.trim();
    final endValue = _endController.text.trim();

    if (startValue.isEmpty && endValue.isEmpty) {
      return 'From - to - ';
    } else if (startValue.isNotEmpty && endValue.isEmpty) {
      return 'From \$$startValue to - ';
    } else if (startValue.isEmpty && endValue.isNotEmpty) {
      return 'From - to \$$endValue ';
    } else {
      return 'From \$$startValue to \$$endValue ';
    }
  }

  void _clearPriceRange() {
    setState(() {
      _startController.clear();
      _endController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.heightOf(context) * 0.4,
      decoration: BoxDecoration(
        color: context.backgroundColor,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: SafeArea(
          top: false,
          child: Column(
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Filter',
                      style: AppTextStyle.s17.copyWith(
                        fontWeight: FontWeight.w600,
                        color: context.primaryTextColor,
                      ),
                    ),
                    GestureDetector(
                      onTap: _clearPriceRange,
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: context.resetValueButtonColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          'Reset',
                          style: AppTextStyle.s15.copyWith(
                            color: context.primaryTextColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              AppGap.h12,

              // Content
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Price Range
                      const _SectionTitle(title: 'Price Range'),
                      AppGap.h15,
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextField(
                              controller: _startController,
                              hintText: '\$',
                              keyboardType: TextInputType.number,
                              onChanged: (value) => setState(() {}),
                            ),
                          ),
                          AppGap.w15,
                          Expanded(
                            child: CustomTextField(
                              controller: _endController,
                              hintText: '\$',
                              keyboardType: TextInputType.number,
                              onChanged: (value) => setState(() {}),
                            ),
                          ),
                        ],
                      ),

                      AppGap.h15,

                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            rangePriceValueText,
                            style: AppTextStyle.s13.copyWith(
                              color: const Color(0xff8F959E),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          GestureDetector(
                            onTap:
                                _clearPriceRange,
                            child: Container(
                              width: 25,
                              height: 25,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                  color: const Color(0xffDEDEDE),
                                ),
                              ),
                              child: Center(
                                child: SvgPicture.asset(IconPath.delete),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              // Bottom Buttons
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 17.5,
                  vertical: 20,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: context.containerButtonTextColor),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Material(
                        color: Color(0xffF5F6FA),
                        borderRadius: BorderRadius.circular(10),
                        child: InkWell(
                          onTap: () => Navigator.pop(context),
                          borderRadius: BorderRadius.circular(10),
                          splashColor: const Color(0xff8F959E).withValues(alpha: 0.2),
                          highlightColor: const Color(
                            0xff8F959E,
                          ).withValues(alpha: 0.1),
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 13.5),
                            alignment: Alignment.center,
                            child: Text(
                              'Cancel',
                              style: AppTextStyle.s17.copyWith(
                                color: const Color(0xff8F959E),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    AppGap.w15,
                    
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 13.5),
                          backgroundColor: const Color(0xff9775FA),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          elevation: 0,
                        ),
                        child: Text(
                          'Confirm',
                          style: AppTextStyle.s17.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;

  const _SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: AppTextStyle.s17.copyWith(
        fontWeight: FontWeight.w600,
        color: context.primaryTextColor,
      ),
    );
  }
}
