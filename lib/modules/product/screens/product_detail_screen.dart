import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stylish_shopping_app/utils/routes.dart';
import 'package:stylish_shopping_app/widgets/star_rating.dart';
import '../../../core/theme/app_text_style.dart';
import 'package:stylish_shopping_app/utils/colors.dart';
import 'package:stylish_shopping_app/models/product_detail_model.dart';
import 'package:stylish_shopping_app/widgets/primary_button.dart';
import 'package:flutter/gestures.dart';
import '../../../widgets/custom_app_bar.dart';

class ProductDetailScreen extends StatefulWidget {
  final ProductDetail product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  String _selectedSize = '';
  String _selectedColor = '';

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

  // TODO: Fix snackbar
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBar(
          leading: IconButton(
            icon: SvgPicture.asset('assets/icons/app_icons/Arrow_Left.svg'),
            onPressed: () => Navigator.pop(context),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
          action: IconButton(
            onPressed: () => Navigator.pushNamed(context, AppRoutes.cart),
            icon: SvgPicture.asset('assets/icons/app_icons/Bag.svg'),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
        ),
        body: _Body(
          product: widget.product,
          selectedSize: _selectedSize,
          onSizeChanged: (size) => setState(() => _selectedSize = size),
          selectedColor: _selectedColor,
          onColorChanged: (color) => setState(() => _selectedColor = color),
          colors: colors,
          hexToColor: _hexToColor,
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

class _Body extends StatefulWidget {
  final ProductDetail product;
  final String selectedSize;
  final Function(String) onSizeChanged;
  final String selectedColor;
  final Function(String) onColorChanged;
  final List<Map<String, String>> colors;
  final Color Function(String) hexToColor;

  const _Body({
    required this.product,
    required this.selectedSize,
    required this.onSizeChanged,
    required this.selectedColor,
    required this.onColorChanged,
    required this.colors,
    required this.hexToColor,
  });

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product Image
          Container(
            width: double.infinity,
            height: 356,
            color: const Color(0xffF2F2F2),
            child: Image.asset(
              widget.product.productImage,
              fit: BoxFit.contain,
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 15),

                // Product Info
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        widget.product.productCategory,
                        style: AppTextStyle.s13.copyWith(
                          color: const Color(0xff8F959E),
                        ),
                      ),
                    ),
                    Text(
                      'Price',
                      style: AppTextStyle.s13.copyWith(
                        color: Color(0xff8F959E),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 8),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        widget.product.productName,
                        style: AppTextStyle.base.copyWith(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xff1D1E20),
                          height: 24 / 22,
                        ),
                      ),
                    ),
                    Text(
                      widget.product.productPrice,
                      style: AppTextStyle.base.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 22,
                        color: const Color(0xff1D1E20),
                        height: 24 / 22,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // Product Images Gallery
                if (widget.product.galleryImages.isNotEmpty)
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: widget.product.galleryImages
                          .asMap()
                          .entries
                          .map((entry) {
                            int index = entry.key;
                            String image = entry.value;
                            return Padding(
                              padding: EdgeInsets.only(
                                right:
                                    index !=
                                        widget.product.galleryImages.length - 1
                                    ? 10
                                    : 0,
                              ),
                              child: _ProductImage(image: image),
                            );
                          })
                          .toList(),
                    ),
                  ),

                const SizedBox(height: 20),

                // Size Selection
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Size',
                      style: AppTextStyle.s17.copyWith(
                        fontWeight: FontWeight.w600,
                        color: const Color(0xff1D1E20),
                      ),
                    ),
                    Text(
                      'Size Guide',
                      style: AppTextStyle.s15.copyWith(
                        color: const Color(0xff8F959E),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 15),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: ['S', 'M', 'L', 'XL', '2XL'].map((size) {
                    final isSelected = widget.selectedSize == size;
                    return GestureDetector(
                      onTap: () => widget.onSizeChanged(size),
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: const Color(0xffF5F6FA),
                          border: Border.all(
                            color: isSelected
                                ? const Color(0xff9775FA)
                                : Color(0xffF5F6FA),
                            width: isSelected ? 2 : 1,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            size,
                            style: AppTextStyle.s17.copyWith(
                              fontWeight: FontWeight.w600,
                              color: const Color(0xff1D1E20),
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),

                const SizedBox(height: 20),

                // Color Selection
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Color',
                      style: AppTextStyle.s17.copyWith(
                        fontWeight: FontWeight.w600,
                        color: const Color(0xff1D1E20),
                      ),
                    ),
                    Text(
                      widget.selectedColor,
                      style: AppTextStyle.s13.copyWith(
                        color: const Color(0xff8F959E),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 15),

                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: widget.colors.map((colorMap) {
                      final colorName = colorMap['name']!;
                      final colorHex = colorMap['hex']!;
                      final isSelected = widget.selectedColor == colorName;

                      return GestureDetector(
                        onTap: () => widget.onColorChanged(colorName),
                        child: Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child: Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              color: widget.hexToColor(colorHex),
                              border: Border.all(
                                color: isSelected
                                    ? const Color(0xff9775FA)
                                    : Color(0xffDEDEDE),
                                width: isSelected ? 2 : 1,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),

                const SizedBox(height: 20),

                // Description
                Text(
                  'Description',
                  style: AppTextStyle.s17.copyWith(
                    fontWeight: FontWeight.w600,
                    color: const Color(0xff1D1E20),
                  ),
                ),

                const SizedBox(height: 10),

                // Expandable Description
                ExpandableDescription(
                  content: widget.product.productDescription,
                ),

                const SizedBox(height: 15),

                // Reviews
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Reviews',
                      style: AppTextStyle.s17.copyWith(
                        fontWeight: FontWeight.w600,
                        color: const Color(0xff1D1E20),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.viewReview);
                      },
                      child: Text(
                        'View All',
                        style: AppTextStyle.s13.copyWith(
                          color: const Color(0xff8F959E),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 15),

                // Reviewer
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundColor: const Color(0xffE0E0E0),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Ronald Richards',
                                    style: AppTextStyle.s15.copyWith(
                                      color: const Color(0xff1D1E20),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        '4.8 ',
                                        style: AppTextStyle.s15.copyWith(
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(
                                        'rating',
                                        style: AppTextStyle.s11.copyWith(
                                          color: const Color(0xff8F959E),
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(height: 7),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.access_time,
                                        size: 15,
                                        color: Color(0xff8F959E),
                                      ),
                                      const SizedBox(width: 5),
                                      Text(
                                        '13 Sep, 2020',
                                        style: AppTextStyle.s11.copyWith(
                                          color: const Color(0xff8F959E),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const StarRating(value: 4.8, starSize: 13),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque malesuada eget vitae amet...',
                      style: AppTextStyle.s15.copyWith(
                        color: const Color(0xff8F959E),
                        fontWeight: FontWeight.w500,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ProductImage extends StatelessWidget {
  final String image;

  const _ProductImage({required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 77,
      height: 77,
      decoration: BoxDecoration(
        color: const Color(0xffF5F6FA),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Image.asset(image, fit: BoxFit.contain),
    );
  }
}

class ExpandableDescription extends StatefulWidget {
  final String content;

  const ExpandableDescription({super.key, required this.content});

  @override
  State<ExpandableDescription> createState() => _ExpandableDescriptionState();
}

class _ExpandableDescriptionState extends State<ExpandableDescription> {
  bool isExpanded = false;
  bool showReadMore = false;
  final int maxLinesToShow = 3;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final textStyle = AppTextStyle.s15.copyWith(
          color: const Color(0xff8F959E),
          fontWeight: FontWeight.w400,
          height: 18 / 15,
        );

        final textSpan = TextSpan(text: widget.content, style: textStyle);

        final textPainter = TextPainter(
          text: textSpan,
          maxLines: maxLinesToShow,
          textDirection: TextDirection.ltr,
        );

        textPainter.layout(maxWidth: constraints.maxWidth);

        final didExceedMaxLines = textPainter.didExceedMaxLines;

        if (showReadMore != didExceedMaxLines) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (mounted) {
              setState(() {
                showReadMore = didExceedMaxLines;
              });
            }
          });
        }

        if (isExpanded) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.content, style: textStyle),
              if (showReadMore)
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isExpanded = false;
                    });
                  },
                  child: Text(
                    'Show Less',
                    style: AppTextStyle.s15.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
            ],
          );
        }

        if (!showReadMore) {
          return Text(widget.content, style: textStyle);
        }

        final readMoreText = ' Read More...';
        final readMoreStyle = AppTextStyle.s15.copyWith(
          color: const Color(0xff1D1E20),
          fontWeight: FontWeight.w600,
        );

        final readMoreSpan = TextSpan(text: readMoreText, style: readMoreStyle);

        final readMorePainter = TextPainter(
          text: readMoreSpan,
          textDirection: TextDirection.ltr,
        );
        readMorePainter.layout();

        final pos = textPainter.getPositionForOffset(
          Offset(
            constraints.maxWidth - readMorePainter.width,
            textPainter.preferredLineHeight * (maxLinesToShow - 1) + 1,
          ),
        );

        final endIndex = textPainter.getOffsetBefore(pos.offset) ?? pos.offset;

        String truncatedText = widget.content
            .substring(0, endIndex)
            .trimRight();

        return RichText(
          text: TextSpan(
            style: textStyle,
            children: [
              TextSpan(text: truncatedText),
              TextSpan(
                text: readMoreText,
                style: readMoreStyle,
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    setState(() {
                      isExpanded = true;
                    });
                  },
              ),
            ],
          ),
        );
      },
    );
  }
}
