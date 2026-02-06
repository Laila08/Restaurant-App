import 'package:flutter/material.dart';
import 'package:food_delivery/ui/widgets/shimmer_text.dart';
import '../../data/models/category_model.dart';
import '../../utils/app_colors.dart';

class CategoryItem extends StatelessWidget {
  final CategoryModel category;
  final bool isSelected;
  final VoidCallback onTap;
  final double textHeight;
  final double fontSize;

  const CategoryItem({
    super.key,
    required this.category,
    required this.isSelected,
    required this.onTap,
    required this.textHeight,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      shadowColor: Colors.grey.withValues(alpha: 0.04),
      borderRadius: BorderRadius.circular(15),
      color: isSelected ? AppColors.primaryColor : Colors.white,
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  category.catImage,
                  height: 35,
                  width: 60,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.broken_image, size: 40),
                ),
              ),
              const SizedBox(height: 6),
              ShimmerText(
                isLoading: false,
                text: category.catName,
                height: textHeight,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: fontSize,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
