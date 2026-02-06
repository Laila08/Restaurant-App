import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/controller/meal_detail_cubit/meal_detail_cubit.dart';
import 'package:food_delivery/extensions/app_extentions.dart';
import 'package:food_delivery/routes/routes.dart';
import '../../../../data/models/meal_model.dart';
import '../../../../utils/app_colors.dart';
import '../../../screens/meal_screen.dart';
import 'dart:ui' as ui;

class MealItem extends StatelessWidget {
  final MealModel meal;

  const MealItem({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        final mealDetailCubit = context.read<MealDetailCubit>();

        // أولاً استدعي الدالة لجلب تفاصيل الوجبة
        mealDetailCubit.getMealDetailsById(meal);

        // ثم اعمل Push للصفحة الجديدة مع BlocProvider.value
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BlocProvider.value(
              value: mealDetailCubit,
              child: MealScreen(meal: meal,),
            ),
          ),
        ).then((_) => FocusScope.of(context).unfocus());
      },
      child: Material(
        elevation: 2,
        shadowColor: Colors.grey.withOpacity(0.5),
        borderRadius: BorderRadius.circular(15),
        child: Container(
          padding: const EdgeInsets.all(9),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  meal.mealImage ?? '',
                  height: 130,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.broken_image, size: 60),
                ),
              ),
              const SizedBox(height: 8),
              Directionality(
                textDirection: ui.TextDirection.ltr,
                child: Text(
                  meal.mealName ?? 'Unnamed Meal',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Text(
                "\$${meal.price.toStringAsFixed(2)}",
                style: TextStyle(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
