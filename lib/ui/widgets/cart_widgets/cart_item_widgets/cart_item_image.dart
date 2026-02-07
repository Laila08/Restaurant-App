import 'package:flutter/material.dart';
import '../../../../utils/app_colors.dart';

class CartItemImage extends StatelessWidget {
  final String? imageUrl;

  const CartItemImage({super.key, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColors.primaryColor.withAlpha(80),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: imageUrl != null && imageUrl!.isNotEmpty
            ? Image.network(imageUrl!, fit: BoxFit.cover)
            : Container(color: Colors.grey[300]),
      ),
    );
  }
}
