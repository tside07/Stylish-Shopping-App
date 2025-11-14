import 'package:flutter/material.dart';
import 'package:stylish_shopping_app/core/constants/resources.dart';
import 'package:stylish_shopping_app/core/theme/app_text_style.dart';
import 'package:stylish_shopping_app/core/widgets/app_gap.dart';
import 'package:stylish_shopping_app/widgets/primary_button.dart';
import 'package:stylish_shopping_app/widgets/form_label.dart';
import 'package:stylish_shopping_app/widgets/custom_text_field.dart';
import 'package:stylish_shopping_app/widgets/custom_app_bar.dart';

class DeliveryAddressScreen extends StatefulWidget {
  const DeliveryAddressScreen({super.key});

  @override
  State<DeliveryAddressScreen> createState() => _DeliveryAddressScreenState();
}

class _DeliveryAddressScreenState extends State<DeliveryAddressScreen> {
  bool _save = false;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _countryController.dispose();
    _cityController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBar(
          leading: AppBarIconButton(
            onPressed: () => Navigator.pop(context),
            svgPath: IconPath.arrowLeft,
          ),
          title: Text(
            'Address',
            style: AppTextStyle.s17.copyWith(
              color: const Color(0xff1D1E20),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: _Body(
                nameController: _nameController,
                countryController: _countryController,
                cityController: _cityController,
                phoneController: _phoneController,
                addressController: _addressController,
                save: _save,
                onSaveChanged: (value) {
                  setState(() {
                    _save = value;
                  });
                },
              ),
            ),

            // Save Address Button
            SizedBox(
              child: PrimaryButton(
                text: 'Save Address',
                color: const Color(0xff9775FA),
                onClick: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController countryController;
  final TextEditingController cityController;
  final TextEditingController phoneController;
  final TextEditingController addressController;
  final bool save;
  final ValueChanged<bool> onSaveChanged;

  const _Body({
    required this.nameController,
    required this.countryController,
    required this.cityController,
    required this.phoneController,
    required this.addressController,
    required this.save,
    required this.onSaveChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppGap.h20,

            // Name
            const FormLabel(text: 'Name'),
            AppGap.h10,
            CustomTextField(
              controller: nameController,
              hintText: 'Hemendra Mali',
            ),

            AppGap.h25,

            // Country and City
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const FormLabel(text: 'Country'),
                      AppGap.h10,
                      CustomTextField(
                        controller: countryController,
                        hintText: 'India',
                      ),
                    ],
                  ),
                ),
                AppGap.w15,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const FormLabel(text: 'City'),
                      AppGap.h10,
                      CustomTextField(
                        controller: cityController,
                        hintText: 'Bangalore',
                      ),
                    ],
                  ),
                ),
              ],
            ),

            AppGap.h25,

            // Phone Number
            const FormLabel(text: 'Phone Number'),
            AppGap.h10,
            CustomTextField(
              controller: phoneController,
              hintText: '+91-800 301 0108',
              keyboardType: TextInputType.phone,
            ),

            AppGap.h25,

            // Address
            FormLabel(text: 'Address'),
            AppGap.h10,
            CustomTextField(
              controller: addressController,
              hintText: '43, Electronics City Phase 1, Electronic City',
            ),

            AppGap.h30,

            // Save switch
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Save as primary address',
                  style: AppTextStyle.s15.copyWith(
                    color: const Color(0xff1D1E20),
                  ),
                ),
                Switch(
                  value: save,
                  activeThumbColor: const Color(0xff34C759),
                  onChanged: onSaveChanged,
                ),
              ],
            ),

            AppGap.h20,
          ],
        ),
      ),
    );
  }
}
