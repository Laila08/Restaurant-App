import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'dart:ui' as ui;
import '../../controller/cart_cubit/cart_cubit.dart';
import '../../controller/meal_detail_cubit/meal_detail_cubit.dart';
import '../../data/models/meal_model.dart';
import '../../utils/app_colors.dart';
import '../widgets/custom_progress.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  late Future<List<MealDetailModel>> favMealsFuture;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    favMealsFuture = loadFavList();
  }
  Future<List<MealDetailModel>> loadFavList()async{
   // final favoriteIds  = SpHelper.getFavorites();
    final cubit = context.read<MealDetailCubit>();
    List<MealDetailModel> tempList = [];
    // for (String id in favoriteIds){
    //   await cubit.getMealDetailsById(id);
    //   if (cubit.state is MealDetailLoadedState) {
    //     tempList.add((cubit.state as MealDetailLoadedState).meal);
    //   }
    // }
    return tempList;
  }
  @override
  Widget build(BuildContext context) {
    return  Directionality(
      textDirection: context.locale.languageCode == 'ar'
          ? ui.TextDirection.rtl
          : ui.TextDirection.ltr,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16, 40, 16, 0),
            child: Text(
              "Favorites".tr(),
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
            ),
          ),
          Expanded(
            child: FutureBuilder<List<MealDetailModel>>(
              future: favMealsFuture,
              builder: (context, snapshot) {
                //final favoriteIds = SpHelper.getFavorites();
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return ListView.builder(
                    padding: const EdgeInsets.all(12),
                    itemCount: 5, // عدد العناصر الوهمية
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Shimmer.fromColors(
                              baseColor: Colors.grey[300]!,
                              highlightColor: Colors.grey[100]!,
                              child: Container(
                                height: 135,
                                width: 80,
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Shimmer.fromColors(
                                    baseColor: Colors.grey[300]!,
                                    highlightColor: Colors.grey[100]!,
                                    child: Container(
                                      height: 20,
                                      width: double.infinity,
                                      color: Colors.grey[300],
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Shimmer.fromColors(
                                    baseColor: Colors.grey[300]!,
                                    highlightColor: Colors.grey[100]!,
                                    child: Container(
                                      height: 14,
                                      width: double.infinity,
                                      color: Colors.grey[300],
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  );
                }
                else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('No favorites found'));
                }
                final meals = snapshot.data!;
                return ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: meals.length,
                  itemBuilder: (context, index) {
                    final meal = meals[index];
                    return Padding(
                      padding:EdgeInsetsDirectional.fromSTEB(12, 12, 12, index == meals.length - 1 ? 20 : 0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.4),
                              spreadRadius: 1,
                              blurRadius: 4,
                              offset: Offset(1, 0),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(9.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: AppColors.primaryColor,
                                ),
                                height: 170,
                                width: 80,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child:
                                  // meal.mealImage != null
                                  //     ? CachedNetworkImage(
                                  //   imageUrl: meal.mealImage!,
                                  //   fit: BoxFit.cover,
                                  //   placeholder: (context, url) => Shimmer.fromColors(
                                  //     baseColor: Colors.grey[300]!,
                                  //     highlightColor: Colors.grey[100]!,
                                  //     child: Container(
                                  //       color: Colors.grey[300],
                                  //       width: 80,
                                  //       height: 135,
                                  //     ),
                                  //   ),
                                  //   errorWidget: (context, url, error) =>
                                  //       Icon(Icons.broken_image, color: Colors.grey),
                                  // )
                                  //     :
                                  Shimmer.fromColors(
                                    baseColor: Colors.grey[300]!,
                                    highlightColor: Colors.grey[100]!,
                                    child: Container(
                                      color: Colors.grey[300],
                                      width: 80,
                                      height: 135,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 230,
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 170,
                                            child: Text(
                                              meal.mealName ?? '',
                                              textDirection: ui.TextDirection.ltr,
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 18),
                                            ),
                                          ),
                                          Spacer(),
                                          InkWell(
                                            onTap: ()async{
                                            //  await SpHelper.removeFavorite(meal.mealId!);
                                              setState(() {
                                                meals.removeWhere((m) => m.mealId == meal.mealId);
                                              });
                                              // تحديث MealCubit لإبلاغ باقي الصفحات (Home)
                                            //  context.read<MealCubit>().toggleFavorite(meal.mealId!);
                                            },
                                            child: Container(
                                              padding: EdgeInsets.all(3),
                                              decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                    color:
                                                    Colors.grey.withOpacity(0.4),
                                                    spreadRadius: 1,
                                                    blurRadius: 4,
                                                    offset: Offset(1, 0),
                                                  ),
                                                ],
                                                borderRadius: BorderRadius.circular(20),
                                                color: Colors.white,
                                              ),
                                              child: Icon(
                                                Icons.favorite,
                                                color: Colors.red,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 230,
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(0,4,0,0),
                                        child: Text(
                                          meal.mealCat.toString(),
                                          overflow: TextOverflow.ellipsis,
                                          textDirection: ui.TextDirection.ltr,
                                          maxLines: 1,
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w400,
                                              color:  AppColors.primaryColor,),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    SizedBox(
                                      width: 230,
                                      child: Text(
                                        meal.instructions,
                                        overflow: TextOverflow.ellipsis,
                                       textDirection: ui.TextDirection.ltr,
                                        maxLines: 2,
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.grey),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    SizedBox(
                                      width: 230,
                                      child: Row(
                                        children: [
                                          Text(
                                            "\$${NumberFormat('#,###')
                                                .format(meal.price)}",
                                            //textDirection: ui.TextDirection.ltr,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18),
                                          ),
                                          Spacer(),
                                          ElevatedButton(
                                            onPressed: () {
                                              //context.read<CartCubit>().addToCart(meal);
                                            },
                                            child: Text(
                                              'add_to_cart'.tr(),
                                              style: TextStyle(
                                                  color: Colors.white, fontSize: 12),
                                            ),
                                            style: ElevatedButton.styleFrom(
                                              elevation: 0,
                                              backgroundColor: AppColors.primaryColor,
                                              shape: ContinuousRectangleBorder(
                                                borderRadius:
                                                BorderRadius.circular(15),
                                              ),
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 15),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
