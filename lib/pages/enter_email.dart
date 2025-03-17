import 'package:digit_assignment/router/app_router.dart';
import 'package:digit_assignment/utils/extensions.dart';
import 'package:digit_assignment/utils/i18_key_constants.dart' as i18;
import 'package:digit_assignment/widgets/layouts/onboarding_layout.dart';
import 'package:digit_assignment/widgets/texts/title_desc.dart';
import 'package:digit_ui_components/digit_components.dart';
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
    return OnBoardingLayout(
      onPressed: () => context.router.push(EnterAddressRoute()),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: spacer4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppTitleDesc(
                context: context,
                title: context.translate(i18.onBoarding.enterYourEmail),
                desc: context.translate(i18.onBoarding.enterYourEmailDesc),
              ),
              const SizedBox(height: spacer5),
              InputField(
                type: InputType.text,
                label: context.translate(i18.onBoarding.emailId).toUpperCase(),
                controller: TextEditingController(),
              ),
              const SizedBox(height: spacer5),
            ],
          ),
        ),
      ],
    );
  }
}
