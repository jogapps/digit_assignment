import 'package:digit_assignment/router/app_router.dart';
import 'package:digit_assignment/utils/extensions.dart';
import 'package:digit_assignment/utils/i18_key_constants.dart' as i18;
import 'package:digit_assignment/widgets/button/bottom_button.dart';
import 'package:digit_assignment/widgets/header/back_navigation_help_header.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/ComponentTheme/pop_up_card_theme.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/widgets/atoms/input_wrapper.dart';
import 'package:digit_ui_components/widgets/atoms/pop_up_card.dart';
import 'package:digit_ui_components/widgets/molecules/show_pop_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';

@RoutePage()
class EnterMobilePage extends StatefulWidget {
  const EnterMobilePage({super.key});

  @override
  State<EnterMobilePage> createState() => _EnterMobilePageState();
}

class _EnterMobilePageState extends State<EnterMobilePage> {
  final TextEditingController otpController = TextEditingController();
  bool next = false;
  final FocusNode pinFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

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
            onPressed:
                () => showCustomPopup(
                  context: context,
                  builder:
                      (ctx) => Popup(
                        onCrossTap: () {
                          Navigator.of(ctx).pop();
                        },
                        title: context.translate(i18.onBoarding.verifyOtp),
                        description: context.translate(
                          i18.onBoarding.verifyOtpDesc,
                        ),
                        onOutsideTap: () {
                          Navigator.of(ctx).pop();
                        },
                        type: PopUpType.simple,
                        actions: [
                          DigitButton(
                            label: context.translate(i18.onBoarding.verify),
                            onPressed: () {
                              Navigator.of(ctx).pop();
                              //context.router.popUntilRoot();
                              context.router.push(AdvocateVerificationRoute());
                            },
                            type: DigitButtonType.primary,
                            size: DigitButtonSize.large,
                            mainAxisSize: MainAxisSize.min,
                          ),
                        ],
                        additionalWidgets: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: SizedBox(
                                    height: 40,
                                    width:
                                        MediaQuery.of(context).size.width < 720
                                            ? MediaQuery.of(
                                                  context,
                                                ).size.width -
                                                50
                                            : 350,
                                    child: PinInputTextField(
                                      pinLength: 6,
                                      cursor: Cursor(
                                        width: 2,
                                        height: 20,
                                        color: Colors.black,
                                        radius: const Radius.circular(0.5),
                                        enabled: true,
                                      ),
                                      decoration: BoxLooseDecoration(
                                        textStyle:
                                            DigitTheme
                                                .instance
                                                .mobileTheme
                                                .textTheme
                                                .bodyLarge,
                                        strokeColorBuilder:
                                            PinListenColorBuilder(
                                              DigitTheme
                                                  .instance
                                                  .colorScheme
                                                  .primary,
                                              Colors.grey,
                                            ),
                                        radius: Radius.zero,
                                      ),
                                      controller: otpController,
                                      onChanged: (value) {
                                        setState(() {
                                          next = otpController.text.length == 6;
                                        });
                                      },
                                      autoFocus: true,
                                      focusNode: pinFocusNode,
                                      textInputAction: TextInputAction.go,
                                      keyboardType: TextInputType.phone,
                                      enableInteractiveSelection: true,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.allow(
                                          RegExp(r'^[0-9]+$'),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: spacer3),
                              Text(
                                context.translate(i18.onBoarding.requestOtp),
                                style:
                                    DigitPopupTheme.defaultTheme(
                                      context,
                                    ).descriptionTextStyle,
                                textAlign: TextAlign.start,
                              ),
                            ],
                          ),
                        ],
                      ),
                ),
          ),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: spacer4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: spacer12),
                  Text(
                    context.translate(i18.onBoarding.pleaseEnterMobile),
                    style: textTheme.headingM,
                  ),
                  SizedBox(height: spacer2),
                  Text(
                    context.translate(i18.onBoarding.pleaseEnterMobileDesc),
                    style: textTheme.bodyL.copyWith(
                      color: DigitColors().light.textSecondary,
                    ),
                  ),
                  SizedBox(height: spacer12),
                  InputField(
                    type: InputType.text,
                    label: context.translate(i18.onBoarding.mobileNo),
                    controller: TextEditingController(),
                    prefixText: '+91',
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    editable: true,
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
