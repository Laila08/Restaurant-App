part of 'category_cubit.dart';

sealed class CategoryState {
  const CategoryState();
}

final class CategoryLoadingState extends CategoryState {
  const CategoryLoadingState();
}

final class CategoryLoadedState extends CategoryState {
  final List<CategoryModel> categories;
  final String selectedCategory;
  final bool showAsGrid;
  const CategoryLoadedState({
    required this.categories,
    required this.selectedCategory,
    this.showAsGrid = false,
  });

  CategoryLoadedState copyWith({
    List<CategoryModel>? categories,
    String? selectedCategory,
    bool? showAsGrid,
  }) {
    return CategoryLoadedState(
      categories: categories ?? this.categories,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      showAsGrid: showAsGrid ?? this.showAsGrid,
    );
  }
}

final class CategoryErrorState extends CategoryState {
  final String error;
  const CategoryErrorState(this.error);
}
