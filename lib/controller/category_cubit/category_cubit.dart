import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/category_model.dart';
import '../../../data/repos/category_repo.dart';
part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryLoadingState());

  Future<void> getCategoryData() async {
    emit(CategoryLoadingState());

    try {
      final categories = await CategoryRepo().getCategory();

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

// class CategoryCubit extends Cubit<CategoryState> {
//   CategoryCubit() : super(CategoryLoadingState());
//   Future<void> getCategoryData() async {
//     try {
//       final List<CategoryModel> categories = await CategoryRepo().getCategory();
//       emit(CategoryLoadedState(
//           categories: categories,
//           selectedCategory:
//               categories.isNotEmpty ? categories[0].catName : ''));
//     } catch (e) {
//       emit(CategoryErrorState(e.toString()));
//     }
//   }
//
//   void selectCategory(String categoryName) {
//     if (state is CategoryLoadedState) {
//       final currentState = state as CategoryLoadedState;
//       emit(CategoryLoadedState(
//         categories: currentState.categories,
//         selectedCategory: categoryName,
//       ));
//     }
//   }
//
//   void toggleViewMode() {
//     if (state is CategoryLoadedState) {
//       final currentState = state as CategoryLoadedState;
//       emit(currentState.copyWith(showAsGrid: !currentState.showAsGrid));
//     }
//   }
// }
