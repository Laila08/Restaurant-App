import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../controller/search_cubit/search_cubit.dart';
import '../../../../utils/app_colors.dart';
import '../../custom_search_field.dart';

class SearchFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final VoidCallback onClear;

  const SearchFieldWidget({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.onClear,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        final showClearIcon =
            state is SearchLoadedState &&
                state.showResults &&
                controller.text.isNotEmpty;

        return CustomSearchField(
          focusNode: focusNode,
          controller: controller,
          textColor: AppColors.blackColor,
          textInputType: TextInputType.name,
          icon: showClearIcon ? Icons.clear : Icons.search,
          onPressed: onClear,
          onFieldSubmitted: () {
            FocusScope.of(context).unfocus();
          },
          onChange: (value) {
            if (value.isNotEmpty) {
              context.read<SearchCubit>().searchMeals(value);
            } else {
              context.read<SearchCubit>().clearResult();
            }
          },
        );
      },
    );
  }
}
