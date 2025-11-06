import 'package:flutter/material.dart';
import 'package:stylish_shopping_app/core/theme/app_text_style.dart';
import 'package:stylish_shopping_app/widgets/primary_button.dart';
import '../../products/widgets/payment_method_item.dart';
import 'package:stylish_shopping_app/widgets/custom_text_field.dart';
import 'package:stylish_shopping_app/widgets/form_label.dart';
import '/widgets/custom_app_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddNewCardScreen extends StatefulWidget {
  const AddNewCardScreen({super.key});

  @override
  State<AddNewCardScreen> createState() => _AddNewCardScreenState();
}

class _AddNewCardScreenState extends State<AddNewCardScreen> {
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
            'Add New Card',
            style: AppTextStyle.s17.copyWith(
              color: const Color(0xff1D1E20),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(child: _Body()),

            SizedBox(
              child: PrimaryButton(
                text: 'Add Card',
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

class _Body extends StatefulWidget {
  const _Body();

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  String selectedPaymentMethod = '1';

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
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 25),

              // Payment method item
              PaymentItem(
                selectedPaymentMethod: selectedPaymentMethod,
                onChanged: (id) {
                  setState(() {
                    selectedPaymentMethod = id;
                  });
                },
              ),

              const SizedBox(height: 32),

              // Name
              const FormLabel(text: 'Card Owner'),
              const SizedBox(height: 12),
              CustomTextField(
                controller: _nameController,
                hintText: 'Mrh Raju',
                keyboardType: TextInputType.name,
              ),

              const SizedBox(height: 24),

              // Number
              const FormLabel(text: 'Card Number'),
              const SizedBox(height: 12),
              CustomTextField(
                controller: _numberController,
                hintText: '5254 7634 8734 7690',
                keyboardType: TextInputType.number,
              ),

              const SizedBox(height: 24),

              // EXP
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const FormLabel(text: 'EXP'),
                        const SizedBox(height: 12),
                        CustomTextField(
                          controller: _expController,
                          hintText: '24/24',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  // CVV
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const FormLabel(text: 'CVV'),
                        const SizedBox(height: 12),
                        CustomTextField(
                          controller: _cvvController,
                          hintText: '7763',
                          keyboardType: TextInputType.number,
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
