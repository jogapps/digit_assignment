import 'package:digit_assignment/widgets/button/bottom_button.dart';
import 'package:digit_assignment/widgets/header/back_navigation_help_header.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:flutter/material.dart';

class OnBoardingLayout extends StatelessWidget {
  const OnBoardingLayout({
    super.key,
    required this.children,
    required this.onPressed,
    this.onPressCheckbox,
    this.buttonLabel,
  });

  final List<Widget> children;
  final dynamic Function() onPressed;
  final Function(bool)? onPressCheckbox;
  final String? buttonLabel;

  @override
  Widget build(BuildContext context) {
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
            onPressed: onPressed,
            label: buttonLabel,
            onPressCheckbox: onPressCheckbox,
          ),
          children: children,
        ),
      ),
    );
  }
}
