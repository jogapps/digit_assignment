import 'package:digit_assignment/router/app_router.dart';
import 'package:digit_assignment/utils/extensions.dart';
import 'package:digit_assignment/utils/i18_key_constants.dart' as i18;
import 'package:digit_assignment/widgets/layouts/onboarding_layout.dart';
import 'package:digit_assignment/widgets/texts/title_desc.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/ComponentTheme/pop_up_card_theme.dart';
import 'package:digit_ui_components/widgets/atoms/input_wrapper.dart';
import 'package:digit_ui_components/widgets/atoms/pop_up_card.dart';
import 'package:digit_ui_components/widgets/molecules/show_pop_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';

@RoutePage()
class EnterAadhaarPage extends StatefulWidget {
  const EnterAadhaarPage({super.key});

  @override
  State<EnterAadhaarPage> createState() => _EnterAadhaarPageState();
}

class _EnterAadhaarPageState extends State<EnterAadhaarPage> {
  final List<TextEditingController> _controllers = List.generate(
    3,
    (_) => TextEditingController(),
  );
  String getCombinedValue() => _controllers.fold<String>(
    '',
    (prev, controller) => prev + controller.text,
  );
  bool isValid() => getCombinedValue().length == 12;

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
    return OnBoardingLayout(
      buttonLabel: i18.onBoarding.getOtp,
      onPressed:
          () => showCustomPopup(
            context: context,
            builder:
                (ctx) => Popup(
                  onCrossTap: () {
                    Navigator.of(ctx).pop();
                  },
                  title: context.translate(i18.onBoarding.verifyYourAadhaar),
                  description: context.translate(i18.onBoarding.verifyOtpDesc),
                  onOutsideTap: () {
                    Navigator.of(ctx).pop();
                  },
                  type: PopUpType.simple,
                  actions: [
                    DigitButton(
                      label: context.translate(i18.onBoarding.verify),
                      onPressed: () {
                        Navigator.of(ctx).pop();
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
                                      ? MediaQuery.of(context).size.width - 50
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
                                  strokeColorBuilder: PinListenColorBuilder(
                                    DigitTheme.instance.colorScheme.primary,
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
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: spacer4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppTitleDesc(
                context: context,
                title: context.translate(i18.onBoarding.enterAadhaarNumber),
                desc: context.translate(i18.onBoarding.enterAadhaarNumberDesc),
              ),
              const SizedBox(height: spacer12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(3, (index) {
                  return SizedBox(
                    width: MediaQuery.of(context).size.width * 0.25,
                    child: InputField(
                      type: InputType.text,
                      controller: _controllers[index],
                      keyboardType: TextInputType.text,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                          RegExp(r'[a-zA-Z0-9]'),
                        ),
                        LengthLimitingTextInputFormatter(4),
                      ],
                      onChange: (value) {
                        // Manual focus handling without focusNode
                        if (value.length == 4 && index < 2) {
                          FocusScope.of(context).nextFocus();
                        }
                        if (value.isEmpty && index > 0) {
                          FocusScope.of(context).previousFocus();
                        }
                      },
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
