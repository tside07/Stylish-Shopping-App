import 'package:flutter/material.dart';

class PaymentMethodModel {
  final String id;
  final String name;
  final String icon;
  final Color? selectedColor;
  final Color? backgroundColor;

  PaymentMethodModel({
    required this.id,
    required this.name,
    required this.icon,
    this.selectedColor,
    this.backgroundColor,
  });

  // Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'icon': icon,
      'selectedColor': selectedColor?.withValues(),
      'backgroundColor': backgroundColor?.withValues(),
    };
  }

  // Create from JSON
  factory PaymentMethodModel.fromJson(Map<String, dynamic> json) {
    return PaymentMethodModel(
      id: json['id'],
      name: json['name'],
      icon: json['icon'],
      selectedColor: json['selectedColor'] != null
          ? Color(json['selectedColor'])
          : null,
      backgroundColor: json['backgroundColor'] != null
          ? Color(json['backgroundColor'])
          : null,
    );
  }

  // Copy with method for updating properties
  PaymentMethodModel copyWith({
    String? id,
    String? name,
    String? icon,
    Color? selectedColor,
    Color? backgroundColor,
  }) {
    return PaymentMethodModel(
      id: id ?? this.id,
      name: name ?? this.name,
      icon: icon ?? this.icon,
      selectedColor: selectedColor ?? this.selectedColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
    );
  }

  // Equality operator
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PaymentMethodModel && other.id == id && other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;

  @override
  String toString() {
    return 'PaymentMethodType(id: $id, name: $name)';
  }
}

final List<PaymentMethodModel> paymentMethods = [
  PaymentMethodModel(
    id: '1',
    name: 'Mastercard',
    icon: 'assets/icons/app_icons/Mastercard.svg',
    selectedColor: const Color(0xffFF5F00),
    backgroundColor: const Color(0xffFFEEE3),
  ),
  PaymentMethodModel(
    id: '2',
    name: 'Paypal',
    icon: 'assets/icons/app_icons/Paypal.svg',
    selectedColor: const Color(0xff0070BA),
    backgroundColor: const Color(0xffA6D5F6),
  ),
  PaymentMethodModel(
    id: '3',
    name: 'Bank',
    icon: 'assets/icons/app_icons/Bank.svg',
    selectedColor: const Color(0xff8F959E),
    backgroundColor: const Color(0xffAFAFAF),
  ),
];
