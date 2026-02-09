import 'package:food_delivery/utils/api_path.dart';
import 'package:food_delivery/utils/app_messages.dart';

import '../models/category_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CategoryRepo {
  Future<List<CategoryModel>> getCategory() async {
    final response = await http.get(Uri.parse(ApiPath.getCategoryPath()));

    if (response.statusCode == 200) {
      final dataMapFromApi = json.decode(response.body);
      final categoriesListInMap = List.from(dataMapFromApi['categories']);

      return categoriesListInMap
          .map((map) => CategoryModel.fromJson(map as Map<String, dynamic>))
          .toList();
    } else {
      throw Exception(AppMessages.failedToLoadCategories);
    }
  }
}
