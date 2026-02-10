import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../controller/search_cubit/search_cubit.dart';
import '../search_widgets/search_empty_widget.dart';
import '../search_widgets/search_error_widget.dart';
import '../search_widgets/search_list_widget.dart';
import '../search_widgets/search_loading_widget.dart';

class SearchResultsList extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;

  const SearchResultsList({
    super.key,
    required this.controller,
    required this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        final bool hasFocus = focusNode.hasFocus;

        if (state is SearchLoadingState && hasFocus) {
          return SearchLoadingWidget();
        }

        if (state is SearchErrorState && hasFocus) {
          return SearchErrorWidget(errorMsg: state.errorMsg);
        }

        if (state is SearchLoadedState && state.showResults && hasFocus) {
          if (state.meals.isEmpty) {
            return const SearchEmptyWidget();
          } else {
            return SearchListWidget(
              meals: state.meals,
              controller: controller,
              focusNode: focusNode,
            );
          }
        }

        return const SizedBox.shrink();
      },
    );
  }
}
