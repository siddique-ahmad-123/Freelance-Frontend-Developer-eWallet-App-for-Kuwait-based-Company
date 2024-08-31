import 'package:flutter/material.dart';

Widget buildDetailRow(BuildContext context, String title, String value) {
  final titleStyle = Theme.of(context).textTheme.bodyMedium?.copyWith(
        fontWeight: FontWeight.w700,
      );
  final valueStyle = Theme.of(context).textTheme.bodyMedium?.copyWith(
        fontWeight: FontWeight.w500,
      );

  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: titleStyle,
        ),
        Text(
          value,
          style: valueStyle,
        ),
      ],
    ),
  );
}
