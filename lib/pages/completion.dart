import 'dart:math';

import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:digit_assignment/utils/asset_images.dart';
import 'package:digit_assignment/utils/extensions.dart';
import 'package:digit_assignment/utils/i18_key_constants.dart' as i18;
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:flutter/material.dart';

@RoutePage()
class CompletionPage extends StatefulWidget {
  const CompletionPage({super.key});

  @override
  State<CompletionPage> createState() => _CompletionPageState();
}

class _CompletionPageState extends State<CompletionPage> {
  bool randomBool = Random().nextBool();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.digitTextTheme(context);

    return Scaffold(
      backgroundColor: DigitTheme.instance.colorScheme.onTertiary,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: spacer4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: context.width * 0.3,
                child: Image.asset(
                  randomBool ? AssetImages.SUCCESS : AssetImages.WAITING,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: spacer6),
              Text(
                context.translate(
                  randomBool
                      ? i18.onBoarding.successTitle
                      : i18.onBoarding.waitingTitle,
                ),
                style: textTheme.headingM,
              ),
              SizedBox(height: spacer2),
              Text(
                context.translate(
                  randomBool
                      ? i18.onBoarding.successTitleDesc
                      : i18.onBoarding.waitingTitleDesc,
                ),
                textAlign: TextAlign.center,
                style: textTheme.bodyL.copyWith(
                  color: DigitColors().light.textSecondary,
                ),
              ),
              SizedBox(height: spacer6),
              DigitButton(
                label: context.translate(i18.onBoarding.fileACase),
                onPressed: () {
                  setState(() {
                    randomBool = !randomBool;
                  });
                },
                type: DigitButtonType.primary,
                size: DigitButtonSize.large,
                mainAxisSize: MainAxisSize.max,
              ),
              SizedBox(height: spacer4),
              DigitButton(
                label: context.translate(i18.onBoarding.joinACase),
                onPressed: () {},
                type: DigitButtonType.secondary,
                size: DigitButtonSize.large,
                mainAxisSize: MainAxisSize.max,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
