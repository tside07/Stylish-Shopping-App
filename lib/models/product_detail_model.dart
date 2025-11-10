class ProductDetail {
  final String productImage;
  final String productName;
  final String productPrice;
  final String productCategory;
  final String productDescription;
  final List<String> galleryImages;
  final String? brandLogo; // Để nullable

  ProductDetail({
    required this.productImage,
    required this.productName,
    required this.productPrice,
    required this.productCategory,
    required this.productDescription,
    required this.galleryImages,
    this.brandLogo,
  });

  // Factory constructor để parse từ JSON (nếu cần API sau)
  factory ProductDetail.fromJson(Map<String, dynamic> json) {
    return ProductDetail(
      productImage: json['productImage'] as String,
      productName: json['productName'] as String,
      productPrice: json['productPrice'] as String,
      productCategory: json['productCategory'] as String,
      productDescription: json['productDescription'] as String,
      galleryImages: List<String>.from(json['galleryImages'] as List),
      brandLogo: json['brandLogo'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'productImage': productImage,
      'productName': productName,
      'productPrice': productPrice,
      'productCategory': productCategory,
      'productDescription': productDescription,
      'galleryImages': galleryImages,
      'brandLogo': brandLogo,
    };
  }
}
