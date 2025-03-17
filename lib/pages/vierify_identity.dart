import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:digit_assignment/utils/extensions.dart';
import 'package:digit_assignment/utils/i18_key_constants.dart' as i18;
import 'package:digit_assignment/widgets/button/bottom_button.dart';
import 'package:digit_assignment/widgets/header/back_navigation_help_header.dart';
import 'package:digit_assignment/widgets/radio/radio_button_card.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:flutter/material.dart';

@RoutePage()
class VerifyIdentityPage extends StatefulWidget {
  const VerifyIdentityPage({super.key});

  @override
  State<VerifyIdentityPage> createState() => _VerifyIdentityPageState();
}

class _VerifyIdentityPageState extends State<VerifyIdentityPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.digitTextTheme(context);

    return Scaffold(
      backgroundColor: DigitTheme.instance.colorScheme.onTertiary,
      body: SafeArea(
        child: ScrollableContent(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          header: BackNavigationHelpHeaderWidget(
            showBackNavigation: true,
            showHelp: true,
          ),
          footer: BottomButton(onPressed: () => {}),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: spacer4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: spacer12),
                  Text(
                    context.translate(i18.onBoarding.verifyIdentity),
                    style: textTheme.headingM,
                  ),
                  SizedBox(height: spacer2),
                  Text(
                    context.translate(i18.onBoarding.verifyIdentityDesc),
                    style: textTheme.bodyL.copyWith(
                      color: DigitColors().light.textSecondary,
                    ),
                  ),
                  const SizedBox(height: spacer5),
                  RadioButtonCard(
                    title: i18.onBoarding.aadhaar,
                    description: i18.onBoarding.aadhaarDesc,
                    value: 1,
                    groupValue: 1,
                    onChanged: (value) => {},
                  ),
                  const SizedBox(height: spacer5),
                  RadioButtonCard(
                    title: i18.onBoarding.otherId,
                    description: i18.onBoarding.otherIdDesc,
                    value: 3,
                    groupValue: 1,
                    onChanged: (value) => {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
