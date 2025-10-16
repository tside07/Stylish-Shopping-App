class CartItem {
  final String id;
  final String productName;
  final String productImage;
  final String price;
  final String taxPrice;
  final String size;
  final String color;
  int quantity;

  CartItem({
    required this.id,
    required this.productName,
    required this.productImage,
    required this.price,
    required this.taxPrice,
    required this.size,
    required this.color,
    this.quantity = 1,
  });

  // Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'productName': productName,
      'productImage': productImage,
      'price': price,
      'tax': taxPrice,
      'size': size,
      'color': color,
      'quantity': quantity,
    };
  }

  // Create from JSON
  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      id: json['id'],
      productName: json['productName'],
      productImage: json['productImage'],
      price: json['price'],
      taxPrice: json['taxPrice'],
      size: json['size'],
      color: json['color'],
      quantity: json['quantity'] ?? 1,
    );
  }

  // Copy with method for updating properties
  CartItem copyWith({
    String? id,
    String? productName,
    String? productImage,
    String? price,
    String? taxPrice,
    String? size,
    String? color,
    int? quantity,
  }) {
    return CartItem(
      id: id ?? this.id,
      productName: productName ?? this.productName,
      productImage: productImage ?? this.productImage,
      price: price ?? this.price,
      taxPrice: taxPrice ?? this.taxPrice,
      size: size ?? this.size,
      color: color ?? this.color,
      quantity: quantity ?? this.quantity,
    );
  }

  // Get price as double
  double getPriceValue() {
    return double.tryParse(price.replaceAll('\$', '').replaceAll(',', '')) ??
        0.0;
  }

  // Calculate total price for this item
  double getTotalPrice() {
    return getPriceValue() * quantity;
  }
}
