import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stylish_shopping_app/core/theme/app_text_style.dart';

class SortBottomSheet extends StatefulWidget {
  const SortBottomSheet({super.key});

  @override
  State<SortBottomSheet> createState() => _SortBottomSheetState();
}

class _SortBottomSheetState extends State<SortBottomSheet> {
  String _selectedSort = 'Most Recent';

  final List<String> _sortOptions = [
    'Price From Lowest to Highest',
    'Price From Highest to Lowest',
    'Product Name (A-Z)',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.42,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Handle bar
            Container(
              margin: const EdgeInsets.only(top: 10),
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: const Color(0xffE7E8EA),
                borderRadius: BorderRadius.circular(2),
              ),
            ),

            const SizedBox(height: 20),

            // Title
            Center(
              child: Text(
                'Sort',
                style: AppTextStyle.s17.copyWith(
                  fontWeight: FontWeight.w600,
                  color: const Color(0xff1D1E20),
                ),
              ),
            ),

            const SizedBox(height: 32),

            // Sort options
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _sortOptions.length,
                separatorBuilder: (context, index) => const SizedBox(height: 8),
                itemBuilder: (context, index) {
                  final option = _sortOptions[index];
                  final isSelected = _selectedSort == option;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedSort = option;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 16,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xffF5F6FA),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(option, style: AppTextStyle.s15.copyWith()),
                          if (isSelected)
                            SvgPicture.asset(
                              "assets/icons/app_icons/Check2.svg",
                            ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 20),

            Container(
              padding: const EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 17.5,
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
                        backgroundColor: const Color(0xffF5F6FA),
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
                  const SizedBox(width: 20),
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
    );
  }
}
