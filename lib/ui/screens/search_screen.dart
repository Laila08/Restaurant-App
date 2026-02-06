import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../utils/app_colors.dart';
import '../widgets/custom_progress.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String,dynamic>> meals=[
      {
        'img':'assets/images/WhatsApp Image 2025-07-22 at 11.53.49_3a1e2680.jpg',
        'name':'meal name',
        'des':'lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem',

      },{
        'img':'assets/images/WhatsApp Image 2025-07-22 at 11.53.49_3a1e2680.jpg',
        'name':'meal name',
        'des':'lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem',

      },{
        'img':'assets/images/WhatsApp Image 2025-07-22 at 11.53.49_3a1e2680.jpg',
        'name':'meal name',
        'des':'lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem',

      },{
        'img':'assets/images/WhatsApp Image 2025-07-22 at 11.53.49_3a1e2680.jpg',
        'name':'meal name',
        'des':'lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem',

      },{
        'img':'assets/images/WhatsApp Image 2025-07-22 at 11.53.49_3a1e2680.jpg',
        'name':'meal name',
        'des':'lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem',

      },{
        'img':'assets/images/WhatsApp Image 2025-07-22 at 11.53.49_3a1e2680.jpg',
        'name':'meal name',
        'des':'lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem',

      }
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Favorites',
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body:  ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount:meals.length,
        itemBuilder: (context, index){
          final meal = meals[index];
          return Padding(
            padding: const EdgeInsets.fromLTRB(12,12,12,0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    spreadRadius: 1,  // مدى انتشار الظل (كل ما زاد زاد الغلاف)
                    blurRadius: 4,    // نعومة الظل
                    offset: Offset(1,0), // تحريك الظل (0,0) يخليه حول كل الأطراف
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
                      height: 120,
                      width: 80,
                    )
                    // ClipRRect(
                    //   borderRadius:
                    //   BorderRadius.circular(15),
                    //   child: CachedNetworkImage(
                    //     imageUrl:meal['img'] ?? '',
                    //     fit: BoxFit.cover,
                    //     height: 120,
                    //     width: 80,
                    //     color: mainColor,
                    //     progressIndicatorBuilder:
                    //         (context, url,
                    //         downloadProgress) =>
                    //         Shimmer.fromColors(
                    //           baseColor: Colors.grey[300]!,
                    //           highlightColor: Colors.grey[100]!,
                    //           child: AspectRatio(
                    //             aspectRatio: 1,
                    //             child: Container(
                    //               color: Colors.grey[300],
                    //             ),
                    //           ),
                    //         ),
                    //     errorWidget: (context, url,
                    //         error) =>
                    //     const Icon(Icons.broken_image,
                    //         color: Colors.grey),
                    //   ),
                    // ),
                   , Padding(
                     padding: const EdgeInsets.fromLTRB(8,0,0,0),
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        SizedBox(
                          width: 230,
                          child: Row(
                            children: [
                              Text(meal['name'].toString(),overflow:TextOverflow.ellipsis,
                                maxLines: 1,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18),),
                              Spacer(),
                              Container(
                                padding: EdgeInsets.all(3),
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.4),
                                      spreadRadius: 1,  // مدى انتشار الظل (كل ما زاد زاد الغلاف)
                                      blurRadius: 4,    // نعومة الظل
                                      offset: Offset(1,0), // تحريك الظل (0,0) يخليه حول كل الأطراف
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                ),child: Icon(Icons.favorite,color: Colors.red,),
                              )
                            ],
                          ),
                        ),
                          SizedBox(height: 10,),
                          SizedBox(
                            width: 230,
                            child: Text(meal['des'].toString(),overflow:TextOverflow.ellipsis,
                              maxLines: 2,style: TextStyle(fontSize:13,fontWeight: FontWeight.w400,color: Colors.grey),),
                          ),
                          SizedBox(height: 10,),
                          SizedBox(
                            width:230 ,
                            child: Row(
                              children: [
                                Text('15,000\$',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
                                Spacer(),
                                ElevatedButton(onPressed:(){}, child: Text('Add to cart',style: TextStyle(color: Colors.white,fontSize: 12),),
                                  style: ElevatedButton.styleFrom(elevation:0,backgroundColor:  AppColors.primaryColor,
                                      shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(15),),padding: EdgeInsets.symmetric(horizontal: 15)),)
                              ],
                            ),
                          )
                      ],),
                   )
                  ],
                ),
              ),
            ),
          );
        } ,)
    );
  }
}
