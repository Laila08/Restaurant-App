class CategoryModel {
  final String catId;
  final String catName;
  final String catImage;
  final String catDescription;

  const CategoryModel({
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
}
