import 'package:digit_assignment/router/app_router.dart';
import 'package:digit_assignment/utils/extensions.dart';
import 'package:digit_assignment/utils/i18_key_constants.dart' as i18;
import 'package:digit_assignment/widgets/layouts/onboarding_layout.dart';
import 'package:digit_assignment/widgets/radio/radio_button_card.dart';
import 'package:digit_assignment/widgets/texts/title_desc.dart';
import 'package:digit_ui_components/digit_components.dart';
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
    return OnBoardingLayout(
      onPressed: () => context.router.push(EnterAadhaarRoute()),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: spacer4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppTitleDesc(
                context: context,
                title: context.translate(i18.onBoarding.verifyIdentity),
                desc: context.translate(i18.onBoarding.verifyIdentityDesc),
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
    );
  }
}
