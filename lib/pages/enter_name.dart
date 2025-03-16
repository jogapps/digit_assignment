import 'package:digit_assignment/router/app_router.dart';
import 'package:digit_assignment/utils/extensions.dart';
import 'package:digit_assignment/utils/i18_key_constants.dart' as i18;
import 'package:digit_assignment/widgets/button/bottom_button.dart';
import 'package:digit_assignment/widgets/header/back_navigation_help_header.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/widgets/atoms/input_wrapper.dart';
import 'package:flutter/material.dart';

@RoutePage()
class EnterNamePage extends StatefulWidget {
  const EnterNamePage({super.key});

  @override
  State<EnterNamePage> createState() => _EnterNamePageState();
}

class _EnterNamePageState extends State<EnterNamePage> {
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
          footer: BottomButton(
            onPressed: () => context.router.push(EnterEmailRoute()),
          ),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: spacer4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: spacer12),
                  Text(
                    context.translate(i18.onBoarding.enterYourName),
                    style: textTheme.headingM,
                  ),
                  SizedBox(height: spacer2),
                  Text(
                    context.translate(i18.onBoarding.enterYourNameDesc),
                    style: textTheme.bodyL.copyWith(
                      color: DigitColors().light.textSecondary,
                    ),
                  ),
                  const SizedBox(height: spacer5),
                  InputField(
                    type: InputType.text,
                    label: context.translate(i18.onBoarding.firstName),
                    controller: TextEditingController(),
                  ),
                  const SizedBox(height: spacer5),
                  InputField(
                    infoText: context.translate(i18.onBoarding.optional),
                    type: InputType.text,
                    label: context.translate(i18.onBoarding.middleName),
                    controller: TextEditingController(),
                  ),
                  const SizedBox(height: spacer5),
                  InputField(
                    type: InputType.text,
                    label: context.translate(i18.onBoarding.lastName),
                    controller: TextEditingController(),
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
