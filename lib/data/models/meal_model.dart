
import 'dart:math';

class MealModel {
  final String mealId;
  final String mealName;
  final String mealImage;
  final double price;

  MealModel({
    this.mealId = '',
    this.mealName = 'Unnamed Meal',
    this.mealImage = '',
    this.price = 0.0,
  });
  static final Random _random = Random();

  static double generatePrice() {
    return (50 + _random.nextInt(71)).toDouble();
  }

  factory MealModel.fromJson(Map<String, dynamic> json) {
    return MealModel(
      mealId: json['idMeal'] ?? '',
      mealName: json['strMeal'] ?? 'Unnamed Meal',
      mealImage: json['strMealThumb'] ?? '',
      price:generatePrice(),
    );
  }

  MealModel copyWith({
    String? mealId,
    String? mealName,
    String? mealImage,
    double? price,
  }) {
    return MealModel(
      mealId: mealId ?? this.mealId,
      mealName: mealName ?? this.mealName,
      mealImage: mealImage ?? this.mealImage,
      price: price ?? this.price,
    );
  }
}
class MealDetailModel extends MealModel {
  final String instructions;
  final String mealCat;
  final String mealArea;

  MealDetailModel({
    required super.mealId,
    required super.mealName,
    required super.mealImage,
    super.price,
    this.instructions = 'No instructions',
    this.mealCat = 'Unknown',
    this.mealArea = 'Unknown',
  });

  factory MealDetailModel.fromJson(Map<String, dynamic> json) {
    return MealDetailModel(
      mealId: json['idMeal'] ?? '',
      mealName: json['strMeal'] ?? 'Unnamed Meal',
      mealImage: json['strMealThumb'] ?? '',
      instructions: json['strInstructions'] ?? 'No instructions',
      mealCat: json['strCategory'] ?? 'Unknown',
      mealArea: json['strArea'] ?? 'Unknown',
      price: 0.0,
    );
  }

  @override
  MealDetailModel copyWith({
    String? mealId,
    String? mealName,
    String? mealImage,
    double? price,
    String? instructions,
    String? mealCat,
    String? mealArea,
  }) {
    return MealDetailModel(
      mealId: mealId ?? this.mealId,
      mealName: mealName ?? this.mealName,
      mealImage: mealImage ?? this.mealImage,
      price: price ?? this.price,
      instructions: instructions ?? this.instructions,
      mealCat: mealCat ?? this.mealCat,
      mealArea: mealArea ?? this.mealArea,
    );
  }
}


/*
class MealDetailModel extends MealModel {
  final String instructions;
  final String? mealCat;
  final String? mealArea;

  MealDetailModel({
    required String mealId,
    required String mealName,
    required String mealImage,
    bool isFav = false,
    double price = 0.0,
    required this.instructions,
    this.mealCat,
    this.mealArea,
  }) : super(
         mealId: mealId,
         mealName: mealName,
         mealImage: mealImage,
         price: price,
       );

  factory MealDetailModel.fromJson(Map<String, dynamic> json) {
    return MealDetailModel(
      mealId: json['idMeal'],
      mealName: json['strMeal'],
      mealImage: json['strMealThumb'],
      instructions: json['strInstructions'] ?? '',
      mealCat: json['strCategory'] ?? '',
      mealArea: json['strArea'] ?? '',
    );
  }
  MealDetailModel copyWith({
    String? mealId,
    String? mealName,
    String? mealImage,
    String? instructions,
    bool? isFav,
    double? price,
  }) {
    return MealDetailModel(
      mealId: mealId ?? this.mealId ?? '',
      mealName: mealName ?? this.mealName ?? '',
      mealImage: mealImage ?? this.mealImage ?? '',
      instructions: instructions ?? this.instructions,
      mealCat: mealCat ?? this.mealCat,
      mealArea: mealArea ?? this.mealArea,
      price: price ?? this.price,
    );
  }
}
*/