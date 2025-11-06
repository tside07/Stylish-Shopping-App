import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stylish_shopping_app/core/theme/app_text_style.dart';
import 'package:stylish_shopping_app/modules/payment_method/widgets/payment_method_widget.dart';
import 'package:stylish_shopping_app/widgets/primary_button.dart';
import 'package:stylish_shopping_app/widgets/custom_text_field.dart';
import 'package:stylish_shopping_app/widgets/form_label.dart';
import 'package:stylish_shopping_app/widgets/save_switch.dart';
import '../../../widgets/custom_app_bar.dart';

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
        appBar: CustomAppBar(
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: SvgPicture.asset('assets/icons/app_icons/Arrow_Left.svg'),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
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
                  CardItem(card: 'assets/images/cards/Card1.png'),
                  const SizedBox(width: 20),
                  CardItem(card: 'assets/images/cards/Card2.png'),
                  const SizedBox(width: 20),
                ],
              ),
            ),

            const SizedBox(height: 15),

            // Add new card button
            AddCard(),

            const SizedBox(height: 20),

            // Card Owner
            const FormLabel(text: 'Card Owner'),
            const SizedBox(height: 10),
            CustomTextField(
              controller: nameController,
              hintText: 'Hemendra Mali',
            ),

            const SizedBox(height: 15),

            // Card Number
            const FormLabel(text: 'Card Number'),
            const SizedBox(height: 10),
            CustomTextField(
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
                      const FormLabel(text: 'EXP'),
                      const SizedBox(height: 10),
                      CustomTextField(
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
                      const FormLabel(text: 'CVV'),
                      const SizedBox(height: 10),
                      CustomTextField(
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
            SaveSwitch(text: 'Save card info', save: save, onSaveChanged: onSaveChanged),
          ],
        ),
      ),
    );
  }
}


