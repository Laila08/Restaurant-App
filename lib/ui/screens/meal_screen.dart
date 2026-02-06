import 'package:flutter/material.dart';
import 'package:food_delivery/data/models/meal_model.dart';
import '../../controller/meal_detail_cubit/meal_detail_cubit.dart';
import '../widgets/custom_progress.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/meal_details_screen_widgets/meal_bottom_bar.dart';
import '../widgets/meal_details_screen_widgets/meal_info.dart';
import '../widgets/meal_details_screen_widgets/meal_sliver_app_bar.dart';

class MealScreen extends StatelessWidget {
  final MealModel meal;
  const MealScreen({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
   // context.read<MealDetailCubit>().getMealDetailsById(mealId,price:price );

    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<MealDetailCubit, MealDetailState>(
        builder: (context, state) {
          if (state is MealDetailLoadingState) {
            return const Center(child: Customprogress());
          } else if (state is MealDetailLoadedState) {
            final meal = state.meal;
            return Stack(
              children: [
                CustomScrollView(
                  slivers: [
                    MealSliverAppBar(meal: meal),
                    SliverList(
                      delegate: SliverChildListDelegate([
                        MealInfo(meal: meal),
                      ]),
                    ),
                    const SliverFillRemaining(
                      hasScrollBody: false,
                      child: SizedBox(height: 60),
                    ),
                  ],
                ),
                MealBottomBar(meal: meal),
              ],
            );
          } else if (state is MealDetailErrorState) {
            return const Center(child: Text('Error loading meal'));
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:easy_localization/easy_localization.dart';
// import '../../controller/meal_detail_cubit/meal_detail_cubit.dart';
// import '../../utils/app_colors.dart';
// import '../widgets/custom_progress.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:intl/intl.dart';
//
// class MealScreen extends StatelessWidget {
//   final String mealId;
//
//   const MealScreen({super.key, required this.mealId});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: BlocBuilder<MealDetailCubit, MealDetailState>(
//         builder: (context, state) {
//           if (state is MealDetailLoadingState) {
//             return const Center(child: Customprogress());
//           } else if (state is MealDetailLoadedState) {
//             final meal = state.meal;
//
//             return Stack(
//               children: [
//                 CustomScrollView(
//                   slivers: [
//                     _buildSliverAppBar(context, meal),
//                     SliverList(
//                       delegate: SliverChildListDelegate([
//                         _buildMealInfo(context, meal),
//                       ]),
//                     ),
//                     SliverFillRemaining(
//                       hasScrollBody: false,
//                       child: Container(height: 60, color: Colors.white),
//                     ),
//                   ],
//                 ),
//                 _buildBottomBar(context, meal),
//               ],
//             );
//           } else if (state is MealDetailErrorState) {
//             return const Center(child: Text('Error loading meal'));
//           } else {
//             return const SizedBox.shrink();
//           }
//         },
//       ),
//     );
//   }
//
//   // ---------------------- Widgets ----------------------
//
//   Widget _buildSliverAppBar(BuildContext context, dynamic meal) {
//     return SliverAppBar(
//       automaticallyImplyLeading: false,
//       expandedHeight: MediaQuery.of(context).size.height * 0.5,
//       pinned: true,
//       stretch: true,
//       backgroundColor: Colors.transparent,
//       elevation: 0,
//       flexibleSpace: LayoutBuilder(
//         builder: (context, constraints) {
//           final bool isCollapsed =
//               constraints.maxHeight <= kToolbarHeight + MediaQuery.of(context).padding.top;
//
//           return Container(
//             color: isCollapsed ? AppColors.primaryColor : Colors.white,
//             child: FlexibleSpaceBar(
//               title: isCollapsed
//                   ? Stack(
//                 children: [
//                   Align(
//                     alignment: Alignment.center,
//                     child: Padding(
//                       padding: const EdgeInsets.only(top: 30.0),
//                       child: Text(
//                         meal.mealName ?? '',
//                         maxLines: 1,
//                         overflow: TextOverflow.ellipsis,
//                         style: const TextStyle(
//                             fontSize: 20, fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                     left: 10,
//                     top: 27,
//                     child: IconButton(
//                       onPressed: () => Navigator.pop(context),
//                       icon: const Icon(Icons.arrow_back),
//                     ),
//                   ),
//                 ],
//               )
//                   : const Text(""),
//               centerTitle: true,
//               background: Stack(
//                 clipBehavior: Clip.antiAlias,
//                 fit: StackFit.expand,
//                 children: [
//                   Hero(
//                     tag: meal.mealId ?? '',
//                     child: Image.network(
//                       meal.mealImage ?? '',
//                       fit: BoxFit.cover,
//                       errorBuilder: (context, error, stackTrace) => Container(
//                         color: Colors.grey[200],
//                         child: const Icon(Icons.broken_image, size: 50),
//                       ),
//                     ),
//                   ),
//                   Align(
//                     alignment: Alignment.topCenter,
//                     child: Padding(
//                       padding: const EdgeInsets.only(top: 45),
//                       child: Text(
//                         'about_this_menu'.tr(),
//                         style: const TextStyle(
//                             color: Colors.white, fontSize: 15, fontWeight: FontWeight.w500),
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                     top: 20,
//                     left: 20,
//                     child: _buildCircleIcon(
//                       icon: Icons.arrow_back_ios,
//                       color: Colors.white,
//                       context: context,
//                       onTap: () => Navigator.pop(context),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
//
//   Widget _buildMealInfo(BuildContext context, dynamic meal) {
//     return Padding(
//       padding: const EdgeInsets.all(13.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             meal.mealName ?? '',
//             maxLines: 1,
//             overflow: TextOverflow.ellipsis,
//             style: const TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 10),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 "\$${NumberFormat('#,###').format(meal.price ?? 0)}",
//                 style: TextStyle(color: AppColors.primaryColor, fontWeight: FontWeight.w600, fontSize: 18),
//               ),
//               Text(
//                 meal.mealArea ?? '',
//                 style: TextStyle(color: AppColors.primaryColor, fontWeight: FontWeight.w500, fontSize: 16),
//               ),
//             ],
//           ),
//           const SizedBox(height: 10),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Row(
//                 children: [
//                   Text("\$", style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.primaryColor, fontSize: 13)),
//                   Text(" ${'free_delivery'.tr()}", style: const TextStyle(fontWeight: FontWeight.w400, color: Color(0xff878787), fontSize: 13)),
//                 ],
//               ),
//               Row(
//                 children: [
//                   Icon(Icons.access_time_filled, color: AppColors.primaryColor, size: 15),
//                   Text(" 20 - 30 ${"minutes".tr()}", style: const TextStyle(fontWeight: FontWeight.w400, color: Color(0xff878787), fontSize: 13)),
//                 ],
//               ),
//               Row(
//                 children: [
//                   Icon(Icons.star, color: AppColors.primaryColor, size: 15),
//                   const Text(" 4.5", style: TextStyle(fontWeight: FontWeight.w400, color: Color(0xff878787), fontSize: 13)),
//                 ],
//               ),
//             ],
//           ),
//           const SizedBox(height: 25),
//           Text('description'.tr(), style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
//           const SizedBox(height: 10),
//           Text(
//             meal.instructions ?? '',
//             style: const TextStyle(color: Color(0xff878787)),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildBottomBar(BuildContext context, dynamic meal) {
//     return Positioned(
//       bottom: 0,
//       left: 1,
//       right: 1,
//       child: Material(
//         color: Colors.white,
//         shadowColor: Colors.grey,
//         elevation: 5,
//         child: Container(
//           width: MediaQuery.of(context).size.width,
//           height: 55,
//           padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
//           margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(50),
//             color: AppColors.primaryColor,
//           ),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text("\$${NumberFormat('#,###').format(meal.price ?? 0)}",
//                   style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17)),
//               ElevatedButton(
//                 onPressed: () {},
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.white,
//                   shape: const StadiumBorder(),
//                   padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
//                 ),
//                 child: Row(
//                   children: [
//                     Icon(Icons.shopping_cart_outlined, color: AppColors.primaryColor, size: 20),
//                     const SizedBox(width: 10),
//                     Text('add_to_cart'.tr(), style: TextStyle(color: AppColors.primaryColor)),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildCircleIcon({
//     required IconData icon,
//     required VoidCallback onTap,
//     required Color color,
//     required BuildContext cntext,
//   }) {
//     return InkWell(a
//       onTap: onTap,
//       child: Container(
//         margin: const EdgeInsets.only(top: 20),
//         width: 40,
//         height: 40,
//         decoration: BoxDecoration(
//           shape: BoxShape.circle,
//           border: Border.all(color: color, width: 1),
//           color: Colors.white.withOpacity(0.8),
//         ),
//         child: Center(child: Icon(icon, size: 20, color: Colors.red)),
//       ),
//     );
//   }
// }
