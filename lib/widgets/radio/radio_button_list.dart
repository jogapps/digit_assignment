import 'package:digit_ui_components/enum/app_enums.dart';
import 'package:digit_ui_components/theme/colors.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/theme/spacers.dart';
import 'package:digit_ui_components/widgets/atoms/digit_divider.dart';
import 'package:flutter/material.dart';

class RadioButtonList extends StatelessWidget {
  const RadioButtonList({
    super.key,
    required this.title,
    this.description,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });

  final String title;
  final String? description;
  final int value;
  final int? groupValue;
  final ValueChanged<int?> onChanged;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.digitTextTheme(context);

    return Column(
      children: [
        Transform.translate(
          offset: const Offset(-spacer2, 0),
          child: RadioListTile(
            activeColor: Light().primary1,
            radioScaleFactor: 1.3,
            contentPadding: EdgeInsets.zero,
            title: Transform.translate(
              offset: const Offset(-spacer2, spacer5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: textTheme.headingM,
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(height: spacer2),
                  Text(
                    "$description",
                    style: textTheme.bodyL.copyWith(
                      color: DigitColors().light.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            value: value,
            groupValue: groupValue,
            onChanged: onChanged,
          ),
        ),
        Transform.translate(
          offset: const Offset(0, spacer8),
          child: DigitDivider(dividerType: DividerType.small),
        ),
      ],
    );
  }
}
