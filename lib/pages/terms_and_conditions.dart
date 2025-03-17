import 'package:digit_assignment/router/app_router.dart';
import 'package:digit_assignment/utils/extensions.dart';
import 'package:digit_assignment/utils/i18_key_constants.dart' as i18;
import 'package:digit_assignment/widgets/layouts/onboarding_layout.dart';
import 'package:digit_assignment/widgets/texts/numbered_texts.dart';
import 'package:digit_assignment/widgets/texts/title_desc.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:flutter/material.dart';

@RoutePage()
class TermsAndConditionsPage extends StatefulWidget {
  const TermsAndConditionsPage({super.key});

  @override
  State<TermsAndConditionsPage> createState() => _TermsAndConditionsPageState();
}

class _TermsAndConditionsPageState extends State<TermsAndConditionsPage> {
  @override
  Widget build(BuildContext context) {
    return OnBoardingLayout(
      onPressCheckbox: (bool) {},
      onPressed: () => context.router.push(CompletionRoute()),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: spacer4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppTitleDesc(
                context: context,
                title: context.translate(i18.onBoarding.termAndCondition),
                desc: context.translate(i18.onBoarding.termAndConditionDesc),
              ),
              const SizedBox(height: spacer12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildNumberedText(
                    1,
                    context.translate(i18.onBoarding.terms1),
                  ),
                  const SizedBox(height: spacer4),
                  buildNumberedText(
                    2,
                    context.translate(i18.onBoarding.terms2),
                  ),
                  const SizedBox(height: spacer4),
                  buildNumberedText(
                    3,
                    context.translate(i18.onBoarding.terms3),
                  ),
                  const SizedBox(height: spacer4),
                  buildNumberedText(
                    4,
                    context.translate(i18.onBoarding.terms4),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
