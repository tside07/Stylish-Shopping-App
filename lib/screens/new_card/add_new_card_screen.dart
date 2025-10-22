import 'package:flutter/material.dart';
import 'package:stylish_shopping_app/core/theme/app_text_style.dart';
import 'package:stylish_shopping_app/widgets/primary_button.dart';
import 'package:stylish_shopping_app/models/payment_method_model.dart';
import 'payment_method_item.dart';
import 'package:stylish_shopping_app/widgets/custom_text_field.dart';
import 'package:stylish_shopping_app/widgets/form_label.dart';

class AddNewCardScreen extends StatefulWidget {
  const AddNewCardScreen({super.key});

  @override
  State<AddNewCardScreen> createState() => _AddNewCardScreenState();
}

class _AddNewCardScreenState extends State<AddNewCardScreen> {
  String selectedPaymentMethod = '1';

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _expController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();

  final List<PaymentMethodModel> paymentMethods = [ //TODO: Fix svg icons
    PaymentMethodModel(
      id: '1',
      name: 'Mastercard',
      icon: 'assets/icons/app_icons/Mastercard.svg',
    ),
    PaymentMethodModel(
      id: '2',
      name: 'Paypal',
      icon: 'assets/icons/app_icons/Paypal.svg',
    ),
    PaymentMethodModel(
      id: '3',
      name: 'Bank',
      icon: 'assets/icons/app_icons/Bank.svg',
    ),
  ];

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
            'Add New Card',
            style: AppTextStyle.s17.copyWith(
              color: const Color(0xff1D1E20),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 25),

                      Row(
                        children: paymentMethods.asMap().entries.map((entry) {
                          int index = entry.key;
                          PaymentMethodModel method = entry.value;
                          final isSelected = selectedPaymentMethod == method.id;

                          return Padding(
                            padding: EdgeInsets.only(
                              right: index != paymentMethods.length - 1
                                  ? 17
                                  : 0,
                            ),
                            child: SizedBox(
                              width: 100,
                              height: 50,
                              child: PaymentMethodItem(
                                method: method,
                                isSelected: isSelected,
                                onTap: () {
                                  setState(() {
                                    selectedPaymentMethod = method.id;
                                  });
                                },
                              ),
                            ),
                          );
                        }).toList(),
                      ),

                      const SizedBox(height: 32),

                      const FormLabel(text: 'Card Owner'),
                      const SizedBox(height: 12),
                      CustomTextField(
                        controller: _nameController,
                        hintText: 'Mrh Raju',
                      ),

                      const SizedBox(height: 24),

                      const FormLabel(text: 'Card Number'),
                      const SizedBox(height: 12),
                      CustomTextField(
                        controller: _numberController,
                        hintText: '5254 7634 8734 7690',
                        keyboardType: TextInputType.number,
                      ),

                      const SizedBox(height: 24),

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
            ),

            SizedBox(
              child: PrimaryButton(
                text: 'Add Card',
                color: const Color(0xff9775FA),
                onClick: () {
                  // TODO: Add card logic
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