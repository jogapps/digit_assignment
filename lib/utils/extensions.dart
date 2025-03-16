import 'package:digit_assignment/blocs/localization/app_localization.dart';
import 'package:digit_assignment/utils/colors.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:flutter/material.dart';

extension on ThemeData {
  get primary => KColors.primary;
  get transparent => DigitTheme.instance.colors.transparent;
}

extension ContextExt on BuildContext {
  ThemeData get theme => Theme.of(this);

  MediaQueryData get mediaQuery => MediaQuery.of(this);

  Size get size => mediaQuery.size;

  double get width => size.width;

  double get height => size.height;

  NavigatorState get navigator => Navigator.of(this);

  ScaffoldMessengerState get scaffoldMessenger => ScaffoldMessenger.of(this);
}

extension LocalizationExtension on BuildContext {
  String translate(String key) {
    final localization = AppLocalizations.of(this);
    return localization?.translate(key) ?? key;
  }
}
