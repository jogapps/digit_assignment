import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:digit_assignment/utils/extensions.dart';
import 'package:digit_assignment/utils/i18_key_constants.dart' as i18;
import 'package:digit_assignment/widgets/button/bottom_button.dart';
import 'package:digit_assignment/widgets/header/back_navigation_help_header.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/widgets/atoms/input_wrapper.dart';
import 'package:flutter/material.dart';

@RoutePage()
class EnterEmailPage extends StatefulWidget {
  const EnterEmailPage({super.key});

  @override
  State<EnterEmailPage> createState() => _EnterEmailPageState();
}

class _EnterEmailPageState extends State<EnterEmailPage> {
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
                    context.translate(i18.onBoarding.enterYourEmail),
                    style: textTheme.headingM,
                  ),
                  SizedBox(height: spacer2),
                  Text(
                    context.translate(i18.onBoarding.enterYourEmailDesc),
                    style: textTheme.bodyL.copyWith(
                      color: DigitColors().light.textSecondary,
                    ),
                  ),
                  const SizedBox(height: spacer5),
                  InputField(
                    type: InputType.text,
                    label:
                        context.translate(i18.onBoarding.emailId).toUpperCase(),
                    controller: TextEditingController(),
                  ),
                  const SizedBox(height: spacer5),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
