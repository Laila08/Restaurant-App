import '../models/category_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CategoryRepo{
  Future<List<CategoryModel>> getCategory() async {
    final response = await http.get(Uri.parse('https://www.themealdb.com/api/json/v1/1/categories.php'));

    if (response.statusCode == 200) {
      final dataMapFromApi = json.decode(response.body);
      final categoriesListInMap = List.from(dataMapFromApi['categories']);

      return categoriesListInMap
          .map((map) => CategoryModel.fromJson(map as Map<String, dynamic>))
          .where((cat) => cat.catName != null && cat.catImage != null)
          .toList();
    } else {
      throw Exception('Failed to load categories');
    }
  }

}
