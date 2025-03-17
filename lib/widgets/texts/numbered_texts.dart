import 'package:digit_ui_components/theme/spacers.dart';
import 'package:flutter/material.dart';

Widget buildNumberedText(int number, String text) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "$number. ",
        style: const TextStyle(fontSize: spacer4, fontWeight: FontWeight.bold),
      ),
      Expanded(
        child: Text(
          text,
          style: const TextStyle(fontSize: spacer4),
          textAlign: TextAlign.left,
        ),
      ),
    ],
  );
}
