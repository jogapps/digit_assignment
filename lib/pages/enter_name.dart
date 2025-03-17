import 'package:digit_assignment/router/app_router.dart';
import 'package:digit_assignment/utils/extensions.dart';
import 'package:digit_assignment/utils/i18_key_constants.dart' as i18;
import 'package:digit_assignment/widgets/layouts/onboarding_layout.dart';
import 'package:digit_assignment/widgets/texts/title_desc.dart';
import 'package:digit_ui_components/digit_components.dart';
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
    return OnBoardingLayout(
      onPressed: () => context.router.push(EnterEmailRoute()),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: spacer4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppTitleDesc(
                context: context,
                title: context.translate(i18.onBoarding.enterYourName),
                desc: context.translate(i18.onBoarding.enterYourNameDesc),
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
    );
  }
}
