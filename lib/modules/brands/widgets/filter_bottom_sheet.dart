import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stylish_shopping_app/core/constants/resources.dart';
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

  String get priceRangeText {
    final start = _startController.text.trim();
    final end = _endController.text.trim();

    if (start.isEmpty && end.isEmpty) {
      return 'From - to - ';
    } else if (start.isNotEmpty && end.isEmpty) {
      return 'From \$$start to -   ';
    } else if (start.isEmpty && end.isNotEmpty) {
      return 'From - to \$$end   ';
    } else {
      return 'From \$$start to \$$end   ';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      decoration: const BoxDecoration(
        color: Colors.white,
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
                        color: const Color(0xff1D1E20),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        //Reset all
                        setState(() {
                          _startController.clear();
                          _endController.clear();
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: const Color(0xff00FFEA),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          'Reset',
                          style: AppTextStyle.s15.copyWith(
                            color: Color(0xff1D1E20),
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

                      // from to
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            priceRangeText,
                            style: AppTextStyle.s13.copyWith(
                              color: const Color(0xff8F959E),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              _startController.clear();
                              _endController.clear();
                            },
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
                                child: SvgPicture.asset(
                                  IconPath.delete,
                                ),
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
                  border: Border.all(color: Color(0xffF5F6FA)),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => Navigator.pop(context),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 13.5),
                          elevation: 0,
                          backgroundColor: Color(0xffF5F6FA),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          'Cancel',
                          style: AppTextStyle.s17.copyWith(
                            color: const Color(0xff8F959E),
                            fontWeight: FontWeight.w500,
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
        color: const Color(0xff1D1E20),
      ),
    );
  }
}
