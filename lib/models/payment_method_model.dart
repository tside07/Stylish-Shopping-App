
class PaymentMethodModel {
  final String id;
  final String name;
  final String icon;

  PaymentMethodModel({
    required this.id,
    required this.name,
    required this.icon,
  });

  // Convert to JSON
  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'icon': icon};
  }

  // Create from JSON
  factory PaymentMethodModel.fromJson(Map<String, dynamic> json) {
    return PaymentMethodModel(
      id: json['id'],
      name: json['name'],
      icon: json['icon'],
    );
  }

  // Copy with method for updating properties
  PaymentMethodModel copyWith({
    String? id,
    String? name,
    String? icon,
  }) {
    return PaymentMethodModel(
      id: id ?? this.id,
      name: name ?? this.name,
      icon: icon ?? this.icon,
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
