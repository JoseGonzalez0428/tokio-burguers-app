import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

/// Imagen de producto. Si el platillo aún no tiene foto muestra un placeholder.
class ProductImage extends StatelessWidget {
  const ProductImage({
    super.key,
    this.imageAsset,
    this.width,
    this.height,
    this.borderRadius = 12,
  });

  final String? imageAsset;
  final double? width;
  final double? height;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    final placeholder = Container(
      width: width,
      height: height,
      color: AppColors.gold.withAlpha(64),
      alignment: Alignment.center,
      child: const Icon(Icons.fastfood, color: AppColors.gold, size: 36),
    );

    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: imageAsset == null
          ? placeholder
          : Image.asset(
              imageAsset!,
              width: width,
              height: height,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => placeholder,
            ),
    );
  }
}
