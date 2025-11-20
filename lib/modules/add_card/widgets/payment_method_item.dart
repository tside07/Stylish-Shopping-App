import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:stylish_shopping_app/core/extensions/theme_extension.dart';
import 'package:stylish_shopping_app/core/theme/theme_provider.dart';
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
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDark = themeProvider.isDarkMode;

    Color? getIconColor() {
      if (method.id == '3') {
        return isDark ? Color(0xffFEFEFE) : null;
      }
      return null;
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isSelected
              ? method.backgroundColor ?? const Color(0xff9775FA)
              : context.inputFieldFillColor,
          border: Border.all(
            color: isSelected
                ? method.selectedColor ?? const Color(0xff9775FA)
                : context.inputFieldFillColor,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
              child: SvgPicture.asset(
                method.icon,
                width: 20,
                height: 20,
                colorFilter: getIconColor() != null
                    ? ColorFilter.mode(getIconColor()!, BlendMode.srcIn)
                    : null,
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
