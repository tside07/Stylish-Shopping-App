import 'package:flutter/material.dart';
import 'package:stylish_shopping_app/core/theme/app_text_style.dart';
import '../widgets/primary_button.dart';
import 'package:stylish_shopping_app/core/theme/app_input_decoration.dart';

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
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back, color: Color(0xff1D1E20)),
          ),
          centerTitle: true,
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
            const SizedBox(height: 20),
      
            // Name
            _buildLabel('Name'),
            const SizedBox(height: 10),
            _buildTextField(
              controller: nameController,
              hintText: 'Hemendra Mali',
            ),
      
            const SizedBox(height: 25),
      
            // Country and City
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildLabel('Country'),
                      const SizedBox(height: 10),
                      _buildTextField(
                        controller: countryController,
                        hintText: 'India',
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildLabel('City'),
                      const SizedBox(height: 10),
                      _buildTextField(
                        controller: cityController,
                        hintText: 'Bangalore',
                      ),
                    ],
                  ),
                ),
              ],
            ),
      
            const SizedBox(height: 25),
      
            // Phone Number
            _buildLabel('Phone Number'),
            const SizedBox(height: 10),
            _buildTextField(
              controller: phoneController,
              hintText: '+91-800 301 0108',
              keyboardType: TextInputType.phone,
            ),
      
            const SizedBox(height: 25),
      
            // Address
            _buildLabel('Address'),
            const SizedBox(height: 10),
            _buildTextField(
              controller: addressController,
              hintText: '43, Electronics City Phase 1, Electronic City',
            ),
      
            const SizedBox(height: 30),
      
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
      
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

Widget _buildLabel(String text) {
  return Text(
    text,
    style: AppTextStyle.s17.copyWith(
      color: const Color(0xff1D1E20),
    ),
  );
}

Widget _buildTextField({
  required TextEditingController controller,
  required String hintText,
  TextInputType keyboardType = TextInputType.text,
}) {
  return Container(
    decoration: BoxDecoration(
      color: const Color(0xffF5F6FA),
      borderRadius: BorderRadius.circular(10),
    ),
    child: TextField(
      controller: controller,
      keyboardType: keyboardType,
      style: AppTextStyle.s15.copyWith(
        fontWeight: FontWeight.w400,
        color: const Color(0xff1D1E20),
      ),
      decoration: AppInputDecoration.outline.copyWith(
        hintText: hintText,
        hintStyle: AppTextStyle.s15.copyWith(
          fontWeight: FontWeight.w400,
          color: const Color(0xff8F959E),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 16.5,
        ),
      ),
    ),
  );
}
