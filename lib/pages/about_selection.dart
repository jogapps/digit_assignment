import 'package:digit_assignment/blocs/onboarding/onboarding_bloc.dart';
import 'package:digit_assignment/router/app_router.dart';
import 'package:digit_assignment/utils/extensions.dart';
import 'package:digit_assignment/utils/i18_key_constants.dart' as i18;
import 'package:digit_assignment/widgets/layouts/onboarding_layout.dart';
import 'package:digit_assignment/widgets/radio/radio_button_list.dart';
import 'package:digit_assignment/widgets/texts/title_desc.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class AboutSelectionPage extends StatefulWidget {
  const AboutSelectionPage({super.key});

  @override
  State<AboutSelectionPage> createState() => _AboutSelectionPageState();
}

class _AboutSelectionPageState extends State<AboutSelectionPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingBloc, OnboardingState>(
      builder: (context, state) {
        return OnBoardingLayout(
          onPressed: () {
            if (state.selectedValue != null) {
              context.read<OnboardingBloc>().add(
                const OnboardingEvent.navigateNext(),
              );
              context.router.push(EnterMobileRoute());
            } else {
              Toast.showToast(
                context,
                message: i18.onBoarding.selectOption,
                type: ToastType.error,
              );
            }
          },
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: spacer4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppTitleDesc(
                    context: context,
                    title: context.translate(i18.splash.tellABitAboutSelf),
                    desc: context.translate(i18.splash.tellABitAboutSelfDetail),
                  ),
                  SizedBox(height: spacer10),
                  Column(
                    children: [
                      RadioButtonList(
                        title: i18.onBoarding.iAmLitigant,
                        description: i18.onBoarding.iAmLitigantDesc,
                        value: 1,
                        groupValue:
                            context.watch<OnboardingBloc>().state.selectedValue,
                        onChanged:
                            (value) => context.read<OnboardingBloc>().add(
                              OnboardingEvent.optionSelected(value!),
                            ),
                      ),
                      SizedBox(height: spacer8),
                      RadioButtonList(
                        title: i18.onBoarding.iAmAdvocate,
                        description: i18.onBoarding.iAmAdvocateDesc,
                        value: 2,
                        groupValue:
                            context.watch<OnboardingBloc>().state.selectedValue,
                        onChanged:
                            (value) => context.read<OnboardingBloc>().add(
                              OnboardingEvent.optionSelected(value!),
                            ),
                      ),
                      SizedBox(height: spacer8),
                      RadioButtonList(
                        title: i18.onBoarding.iAmAdvocateClerk,
                        description: i18.onBoarding.iAmAdvocateClerkDesc,
                        value: 3,
                        groupValue:
                            context.watch<OnboardingBloc>().state.selectedValue,
                        onChanged:
                            (value) => context.read<OnboardingBloc>().add(
                              OnboardingEvent.optionSelected(value!),
                            ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
