import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stylish_shopping_app/core/theme/app_text_style.dart';
import 'package:stylish_shopping_app/utils/routes.dart';
import 'package:stylish_shopping_app/widgets/primary_button.dart';

class PaymentMethodScreen extends StatefulWidget {
  const PaymentMethodScreen({super.key});

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  bool _save = false;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _expController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _numberController.dispose();
    _expController.dispose();
    _cvvController.dispose();
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
            'Payment',
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
                numberController: _numberController,
                expController: _expController,
                cvvController: _cvvController,
                save: _save,
                onSaveChanged: (value) {
                  setState(() {
                    _save = value;
                  });
                },
              ),
            ),
            SizedBox(

              child: PrimaryButton(
                text: 'Save Card',
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
  final TextEditingController numberController;
  final TextEditingController expController;
  final TextEditingController cvvController;
  final bool save;
  final ValueChanged<bool> onSaveChanged;

  const _Body({
    required this.nameController,
    required this.numberController,
    required this.expController,
    required this.cvvController,
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
            const SizedBox(height: 25),

            // Card Images
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _CardItem(card: 'assets/images/cards/Card1.png'),
                  const SizedBox(width: 20),
                  _CardItem(card: 'assets/images/cards/Card2.png'),
                  const SizedBox(width: 20),
                ],
              ),
            ),

            const SizedBox(height: 15),

            // Add new card button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {
                  // TODO: Add new card logic
                },
                style: OutlinedButton.styleFrom(
                  backgroundColor: const Color(0xffF6F2FF),
                  side: const BorderSide(color: Color(0xff9775FA), width: 1.5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(vertical: 15.5),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/icons/app_icons/Plus.svg',
                      colorFilter: const ColorFilter.mode(
                        Color(0xff9775FA),
                        BlendMode.srcIn,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      'Add new card',
                      style: AppTextStyle.s17.copyWith(
                        color: const Color(0xff9775FA),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Card Owner
            _buildLabel('Card Owner'),
            const SizedBox(height: 10),
            _buildTextField(
              controller: nameController,
              hintText: 'Hemendra Mali',
            ),

            const SizedBox(height: 15),

            // Card Number
            _buildLabel('Card Number'),
            const SizedBox(height: 10),
            _buildTextField(
              controller: numberController,
              hintText: '5254 7634 8734 7690',
              keyboardType: TextInputType.number,
            ),

            const SizedBox(height: 15),

            // EXP and CVV
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildLabel('EXP'),
                      const SizedBox(height: 10),
                      _buildTextField(
                        controller: expController,
                        hintText: '24/24',
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildLabel('CVV'),
                      const SizedBox(height: 10),
                      _buildTextField(
                        controller: cvvController,
                        hintText: '7763',
                        keyboardType: TextInputType.number,
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Save switch
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Save card info',
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

class _CardItem extends StatelessWidget {
  final String card;

  const _CardItem({required this.card});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 185,
      width: 300,
      child: Image.asset(card, fit: BoxFit.contain),
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
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: AppTextStyle.s15.copyWith(
          fontWeight: FontWeight.w400,
          color: const Color(0xff8F959E),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 16.5,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xff9775FA), width: 1.5),
        ),
      ),
    ),
  );
}
