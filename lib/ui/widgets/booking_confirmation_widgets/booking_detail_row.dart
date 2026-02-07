import 'package:flutter/material.dart';

import '../../../extensions/app_extensions.dart';

class BookingDetailRow extends StatelessWidget {
  final String title;
  final String value;
  const BookingDetailRow({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Text(
            "$title:",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        Expanded(
          flex: 5,
          child: Text(
            value,
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ],
    ).paddingV(5);
  }
}