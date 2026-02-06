import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:equatable/equatable.dart';


class CategoryModel extends Equatable{
  final String catId;
  final String catName;
  final String catImage;
  final String catDescription;

  CategoryModel({
    required this.catId,
    required this.catName,
    required this.catImage,
    required this.catDescription,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      catId: json['idCategory'],
      catName: json['strCategory'],
      catImage: json['strCategoryThumb'],
      catDescription: json['strCategoryDescription'],
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [ catId, catName,catImage,catDescription];
}




















