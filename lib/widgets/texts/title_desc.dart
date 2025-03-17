import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:flutter/material.dart';

Widget AppTitleDesc({
  required BuildContext context,
  required String title,
  required String desc,
}) {
  final theme = Theme.of(context);
  final textTheme = theme.digitTextTheme(context);

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(height: spacer12),
      Text(title, style: textTheme.headingM),
      SizedBox(height: spacer2),
      Text(
        desc,
        style: textTheme.bodyL.copyWith(
          color: DigitColors().light.textSecondary,
        ),
      ),
    ],
  );
}
