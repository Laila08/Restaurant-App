import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/category_model.dart';
import '../../../data/repos/category_repo.dart';
part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final CategoryRepo _repo;
  CategoryCubit(this._repo) : super(CategoryLoadingState());
  Future<void> getCategoryData() async {
    emit(CategoryLoadingState());

    try {
      final categories = await _repo.getCategory();

      if (categories.isEmpty) {
        emit(CategoryErrorState('No categories found'));
        return;
      }

      emit(
        CategoryLoadedState(
          categories: categories,
          selectedCategory: categories.first.catName,
          showAsGrid: false,
        ),
      );
    } catch (e) {
      emit(CategoryErrorState(e.toString()));
    }
  }

  void selectCategory(String categoryName) {
    final currentState = state;
    if (currentState is! CategoryLoadedState) return;

    if (currentState.selectedCategory == categoryName) return;

    emit(currentState.copyWith(selectedCategory: categoryName));
  }

  void toggleViewMode() {
    final currentState = state;
    if (currentState is! CategoryLoadedState) return;

    emit(currentState.copyWith(showAsGrid: !currentState.showAsGrid));
  }
}
