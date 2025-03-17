import 'package:digit_assignment/utils/extensions.dart';
import 'package:digit_assignment/utils/i18_key_constants.dart' as i18;
import 'package:digit_ui_components/digit_components.dart';
import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({super.key, required this.onPressed, this.label});

  final Function() onPressed;
  final String? label;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // DigitCard(
        //   margin: const EdgeInsets.only(top: spacer2),
        //   children: [
        //     Padding(
        //       padding: EdgeInsets.symmetric(
        //         vertical: spacer5,
        //         horizontal: spacer4,
        //       ),
        //       child: DigitButton(
        //         label: i18.onBoarding.continueText,
        //         onPressed: onPressed,
        //         type: DigitButtonType.primary,
        //         size: DigitButtonSize.large,
        //         mainAxisSize: MainAxisSize.max,
        //       ),
        //     ),
        //   ],
        // ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: spacer6, horizontal: spacer4),
          child: DigitButton(
            label: context.translate(this.label ?? i18.onBoarding.continueText),
            onPressed: onPressed,
            type: DigitButtonType.primary,
            size: DigitButtonSize.large,
            mainAxisSize: MainAxisSize.max,
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Container(
            height: spacer1,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  DigitColors().light.textPrimary.withOpacity(0.15),
                  DigitColors().transparent,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
