import 'package:flutter/material.dart';
import 'package:stylish_shopping_app/utils/routes.dart';
import '../../../core/theme/app_text_style.dart';
import 'package:stylish_shopping_app/utils/colors.dart';
import 'package:stylish_shopping_app/models/product_detail_model.dart';
import 'package:stylish_shopping_app/widgets/primary_button.dart';
import 'package:stylish_shopping_app/modules/products/widgets/product_detail_widget.dart';

class ProductDetailScreen extends StatefulWidget {
  final ProductDetail product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  String _selectedSize = '';
  String _selectedColor = '';
  int _selectedImageIndex = 0;

  final List<Map<String, String>> colors = ProductColors.colors;

  Color _hexToColor(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 7 && hexString.startsWith('#')) {
      buffer.write('ff');
      buffer.write(hexString.replaceFirst('#', ''));
    } else if (hexString.length == 6) {
      buffer.write('ff');
      buffer.write(hexString);
    } else {
      return Colors.grey;
    }
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  void _showFloatingSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          textAlign: TextAlign.center,
          style: AppTextStyle.base.copyWith(
            fontSize: 16,
            height: 18 / 16,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xff1D1E20),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        margin: const EdgeInsets.only(bottom: 20),
        duration: const Duration(seconds: 3),
      ),
    );
  }

  String get _currentImage {
    return _selectedImageIndex == 0
        ? widget.product.productImage
        : widget.product.galleryImages[_selectedImageIndex - 1];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      right: false,
      left: false,
      child: Scaffold(
        backgroundColor: const Color(0xffF2F2F2),
        body: Column(
          children: [
            ProductImageSection(
              mainImage: _currentImage,
              onBackPressed: () => Navigator.pop(context),
              onCartPressed: () => Navigator.pushNamed(context, AppRoutes.cart),
              brandLogo: widget.product.brandLogo,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 15),
                      ProductInfo(
                        category: widget.product.productCategory,
                        name: widget.product.productName,
                        price: widget.product.productPrice,
                      ),
                      const SizedBox(height: 20),
                      if (widget.product.galleryImages.isNotEmpty)
                        GalleryImages(
                          mainImage: widget.product.productImage,
                          galleryImages: widget.product.galleryImages,
                          selectedIndex: _selectedImageIndex,
                          onImageTapped: (index) {
                            setState(() => _selectedImageIndex = index);
                          },
                        ),
                      const SizedBox(height: 20),
                      SizeSelection(
                        selectedSize: _selectedSize,
                        onSizeChanged: (size) {
                          setState(() => _selectedSize = size);
                        },
                      ),
                      const SizedBox(height: 20),
                      ColorSelection(
                        selectedColor: _selectedColor,
                        colors: colors,
                        hexToColor: _hexToColor,
                        onColorChanged: (color) {
                          setState(() => _selectedColor = color);
                        },
                      ),
                      const SizedBox(height: 20),
                      ProductDescription(
                        content: widget.product.productDescription,
                      ),
                      const SizedBox(height: 15),
                      const ProductReviewsSection(),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: PrimaryButton(
          text: 'Add to Cart',
          color: const Color(0xff9775FA),
          onClick: () {
            if (_selectedSize.isEmpty || _selectedColor.isEmpty) {
              _showFloatingSnackBar('Please select size and color');
              return;
            }
            _showFloatingSnackBar('Added to cart');
          },
        ),
      ),
    );
  }
}
