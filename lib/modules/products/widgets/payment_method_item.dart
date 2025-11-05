import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stylish_shopping_app/models/payment_method_model.dart';

class PaymentMethodItem extends StatelessWidget {
  final PaymentMethodModel method;
  final bool isSelected;
  final VoidCallback onTap;

  const PaymentMethodItem({
    super.key,
    required this.method,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0XffF5F6FA),
          border: Border.all(
            color: isSelected
                ? const Color(0xff9775FA)
                : const Color(0xffFEFEFE),
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Center(
                child: SvgPicture.asset(method.icon, width: 18, height: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentItem extends StatelessWidget {
  final String selectedPaymentMethod;
  final ValueChanged<String> onChanged;

  const PaymentItem({
    super.key,
    required this.selectedPaymentMethod,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: paymentMethods.asMap().entries.map((entry) {
        int index = entry.key;
        PaymentMethodModel method = entry.value;
        final isSelected = selectedPaymentMethod == method.id;

        return Padding(
          padding: EdgeInsets.only(
            right: index != paymentMethods.length - 1 ? 17 : 0,
          ),
          child: SizedBox(
            width: 100,
            height: 50,
            child: PaymentMethodItem(
              method: method,
              isSelected: isSelected,
              onTap: () {
                onChanged(method.id);
              },
            ),
          ),
        );
      }).toList(),
    );
  }
}
