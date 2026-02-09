import 'dart:ui' as ui;

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../widgets/cart_widgets/cart_header.dart';
import '../widgets/cart_widgets/cart_list.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: context.locale.languageCode == 'ar'
          ? ui.TextDirection.rtl
          : ui.TextDirection.ltr,
      child: Column(
        children: const [
          CartHeader(),
          Expanded(child: CartList()),
        ],
      ),
    );
  }
}
