import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stylish_shopping_app/core/constants/resources.dart';
import 'package:stylish_shopping_app/core/widgets/app_gap.dart';
import 'package:stylish_shopping_app/utils/routes.dart';
import 'package:stylish_shopping_app/widgets/star_rating.dart';
import 'package:stylish_shopping_app/widgets/view_all_button.dart';
import '../../../core/theme/app_text_style.dart';
import 'package:flutter/gestures.dart';
// import 'package:stylish_shopping_app/widgets/custom_app_bar.dart';

class ProductImageSection extends StatelessWidget {
  final String mainImage;
  final VoidCallback onBackPressed;
  final VoidCallback onCartPressed;
  final String? brandLogo;

  const ProductImageSection({
    super.key,
    required this.mainImage,
    required this.onBackPressed,
    required this.onCartPressed,
    this.brandLogo,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 35),
          child: Container(
            width: double.infinity,
            height: 356,
            color: const Color(0xffF2F2F2),
            child: Stack(
              children: [
                // Hình sản phẩm
                Positioned.fill(
                  child: Image.asset(mainImage, fit: BoxFit.contain),
                ),

                Align(
                  alignment: Alignment(0, 1),
                  child: Image.asset(Images.backgroundBrand),
                ),

                  Align(
                    alignment: Alignment(0, 0.95),
                    child: Image.asset(
                      'assets/images/brands/logo_nike.png', // brand logo
                      width: 48,
                      height: 25,
                      fit: BoxFit.contain,
                    ),
                  ),
              ],
            ),
          ),
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _IconButton(
                  icon: IconPath.arrowLeft,
                  onPressed: onBackPressed,
                ),
                _IconButton(
                  icon: IconPath.bag,
                  onPressed: onCartPressed,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _IconButton extends StatelessWidget {
  final String icon;
  final VoidCallback onPressed;

  const _IconButton({required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xffF5F6FA),
        ),
        child: SvgPicture.asset(icon, width: 25, height: 25),
      ),
    );
  }
}

class ProductInfo extends StatelessWidget {
  final String category;
  final String name;
  final String price;

  const ProductInfo({
    super.key,
    required this.category,
    required this.name,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              category,
              style: AppTextStyle.s13.copyWith(color: const Color(0xff8F959E)),
            ),
            AppGap.h8,
            SizedBox(
              width: 300,
              child: Text(
                name,
                style: AppTextStyle.base.copyWith(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xff1D1E20),
                  height: 24 / 22,
                ),
                maxLines: 3,
              ),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Price',
              style: AppTextStyle.s13.copyWith(color: const Color(0xff8F959E)),
            ),
            AppGap.h8,
            Text(
              price,
              style: AppTextStyle.base.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 22,
                color: const Color(0xff1D1E20),
                height: 24 / 22,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class GalleryImages extends StatelessWidget {
  final String mainImage;
  final List<String> galleryImages;
  final int selectedIndex;
  final Function(int) onImageTapped;

  const GalleryImages({
    super.key,
    required this.mainImage,
    required this.galleryImages,
    required this.selectedIndex,
    required this.onImageTapped,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _GalleryThumbnail(
            image: mainImage,
            isSelected: selectedIndex == 0,
            onTap: () => onImageTapped(0),
          ),
          AppGap.w10,

          ...galleryImages.asMap().entries.map((entry) {
            int index = entry.key + 1;
            String image = entry.value;
            return Padding(
              padding: EdgeInsets.only(
                right: index != galleryImages.length ? 10 : 0,
              ),
              child: _GalleryThumbnail(
                image: image,
                isSelected: selectedIndex == index,
                onTap: () => onImageTapped(index),
              ),
            );
          }),
        ],
      ),
    );
  }
}

class _GalleryThumbnail extends StatelessWidget {
  final String image;
  final bool isSelected;
  final VoidCallback onTap;

  const _GalleryThumbnail({
    required this.image,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 77,
        height: 77,
        decoration: BoxDecoration(
          color: const Color(0xffF5F6FA),
          border: Border.all(
            color: isSelected ? const Color(0xff9775FA) : Colors.transparent,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(image, fit: BoxFit.contain),
        ),
      ),
    );
  }
}

class SizeSelection extends StatelessWidget {
  final String selectedSize;
  final Function(String) onSizeChanged;

  const SizeSelection({
    super.key,
    required this.selectedSize,
    required this.onSizeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
        AppGap.h15,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: ['S', 'M', 'L', 'XL', '2XL'].map((size) {
            final isSelected = selectedSize == size;
            return _SizeButton(
              size: size,
              isSelected: isSelected,
              onTap: () => onSizeChanged(size),
            );
          }).toList(),
        ),
      ],
    );
  }
}

class _SizeButton extends StatelessWidget {
  final String size;
  final bool isSelected;
  final VoidCallback onTap;

  const _SizeButton({
    required this.size,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: const Color(0xffF5F6FA),
          border: Border.all(
            color: isSelected
                ? const Color(0xff9775FA)
                : const Color(0xffF5F6FA),
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
  }
}

class ColorSelection extends StatelessWidget {
  final String selectedColor;
  final List<Map<String, String>> colors;
  final Color Function(String) hexToColor;
  final Function(String) onColorChanged;

  const ColorSelection({
    super.key,
    required this.selectedColor,
    required this.colors,
    required this.hexToColor,
    required this.onColorChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
              selectedColor,
              style: AppTextStyle.s13.copyWith(color: const Color(0xff8F959E)),
            ),
          ],
        ),
        AppGap.h15,
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: colors.map((colorMap) {
              final colorName = colorMap['name']!;
              final colorHex = colorMap['hex']!;
              final isSelected = selectedColor == colorName;

              return _ColorButton(
                color: hexToColor(colorHex),
                isSelected: isSelected,
                onTap: () => onColorChanged(colorName),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}

class _ColorButton extends StatelessWidget {
  final Color color;
  final bool isSelected;
  final VoidCallback onTap;

  const _ColorButton({
    required this.color,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: 12),
        child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: color,
            border: Border.all(
              color: isSelected
                  ? const Color(0xff9775FA)
                  : const Color(0xffDEDEDE),
              width: isSelected ? 2 : 1,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}

class ProductDescription extends StatelessWidget {
  final String content;

  const ProductDescription({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Description',
          style: AppTextStyle.s17.copyWith(
            fontWeight: FontWeight.w600,
            color: const Color(0xff1D1E20),
          ),
        ),
        AppGap.h10,
        ExpandableDescription(content: content),
      ],
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

class ProductReviewsSection extends StatelessWidget {
  const ProductReviewsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ViewAllButton(
          header: 'Reviews',
          button: 'View All',
          onTap: () {
            Navigator.pushNamed(context, AppRoutes.viewReview);
          },
        ),
        AppGap.h15,
        const _ReviewItem(),
      ],
    );
  }
}

class _ReviewItem extends StatelessWidget {
  const _ReviewItem();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CircleAvatar(radius: 20, backgroundColor: Color(0xffCCD9E0)),
            AppGap.w10,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _Reviewer(name: 'Ronald Richards', rating: '4.8'),
                  AppGap.h7,

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.access_time,
                            size: 15,
                            color: Color(0xff8F959E),
                          ),
                          AppGap.w5,
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
        AppGap.h10,
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
    );
  }
}

class _Reviewer extends StatelessWidget {
  final String name;
  final String rating;

  const _Reviewer({required this.name, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          name,
          style: AppTextStyle.s15.copyWith(
            color: const Color(0xff1D1E20),
            fontWeight: FontWeight.w600,
          ),
        ),
        Row(
          children: [
            Text(
              rating,
              style: AppTextStyle.s15.copyWith(fontWeight: FontWeight.w600),
            ),
            AppGap.w5,

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
    );
  }
}
