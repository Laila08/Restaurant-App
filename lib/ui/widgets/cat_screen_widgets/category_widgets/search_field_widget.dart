import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../controller/search_cubit/search_cubit.dart';
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
        return CustomSearchField(
          validator: (v) {},
          focusNode: focusNode,
          onFieldSubmitted: () {
            FocusScope.of(context).unfocus();
            final state = context.read<SearchCubit>().state;
            if (state is SearchLoadedState && state.meals.isNotEmpty) {
              context.read<SearchCubit>().clearResult();
              controller.clear();
            }
          },
          onPressed: onClear,
          textColor: Colors.black,
          textInputType: TextInputType.name,
          onChange: (value) {
            if (value.isNotEmpty) {
              context.read<SearchCubit>().searchMeals(value);
            }
          },
          controller: controller,
          icon: state is SearchLoadedState && state.showResults
              ? Icons.clear
              : Icons.search,
        );
      },
    );
  }
}
