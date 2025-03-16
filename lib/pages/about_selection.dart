import 'package:digit_assignment/blocs/onboarding/onboarding_bloc.dart';
import 'package:digit_assignment/router/app_router.dart';
import 'package:digit_assignment/utils/extensions.dart';
import 'package:digit_assignment/utils/i18_key_constants.dart' as i18;
import 'package:digit_assignment/widgets/button/bottom_button.dart';
import 'package:digit_assignment/widgets/header/back_navigation_help_header.dart';
import 'package:digit_assignment/widgets/radio/radio_button_list.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
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
    final theme = Theme.of(context);
    final textTheme = theme.digitTextTheme(context);

    return Scaffold(
      backgroundColor: DigitTheme.instance.colorScheme.onTertiary,
      body: SafeArea(
        child: BlocBuilder<OnboardingBloc, OnboardingState>(
          builder: (context, state) {
            return ScrollableContent(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              header: BackNavigationHelpHeaderWidget(
                showBackNavigation: true,
                showHelp: true,
              ),
              footer: BottomButton(
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
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: spacer4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: spacer12),
                      Text(
                        context.translate(i18.splash.tellABitAboutSelf),
                        style: textTheme.headingM,
                      ),
                      SizedBox(height: spacer2),
                      Text(
                        context.translate(i18.splash.tellABitAboutSelfDetail),
                        style: textTheme.bodyL.copyWith(
                          color: DigitColors().light.textSecondary,
                        ),
                      ),
                      SizedBox(height: spacer12),
                      Column(
                        children: [
                          RadioButtonList(
                            title: i18.onBoarding.iAmLitigant,
                            description: i18.onBoarding.iAmLitigantDesc,
                            value: 1,
                            groupValue:
                                context
                                    .watch<OnboardingBloc>()
                                    .state
                                    .selectedValue,
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
                                context
                                    .watch<OnboardingBloc>()
                                    .state
                                    .selectedValue,
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
                                context
                                    .watch<OnboardingBloc>()
                                    .state
                                    .selectedValue,
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
        ),
      ),
    );
  }
}
