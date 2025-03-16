import 'package:digit_assignment/router/app_router.dart';
import 'package:digit_assignment/utils/extensions.dart';
import 'package:digit_assignment/utils/i18_key_constants.dart' as i18;
import 'package:digit_assignment/widgets/button/bottom_button.dart';
import 'package:digit_assignment/widgets/header/back_navigation_help_header.dart';
import 'package:digit_ui_components/models/DropdownModels.dart';
import 'package:digit_ui_components/theme/colors.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/theme/digit_theme.dart';
import 'package:digit_ui_components/theme/spacers.dart';
import 'package:digit_ui_components/widgets/atoms/dropdown_wrapper.dart';
import 'package:digit_ui_components/widgets/atoms/input_wrapper.dart';
import 'package:digit_ui_components/widgets/atoms/labelled_fields.dart';
import 'package:digit_ui_components/widgets/atoms/upload_popUp.dart';
import 'package:digit_ui_components/widgets/scrollable_content.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

@RoutePage()
class AdvocateVerificationPage extends StatefulWidget {
  const AdvocateVerificationPage({super.key});

  @override
  State<AdvocateVerificationPage> createState() =>
      _AdvocateVerificationPageState();
}

class _AdvocateVerificationPageState extends State<AdvocateVerificationPage> {
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
            onPressed: () => context.router.push(EnterNameRoute()),
          ),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: spacer4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: spacer12),
                  Text(
                    context.translate(i18.onBoarding.advocateVerification),
                    style: textTheme.headingM,
                  ),
                  SizedBox(height: spacer2),
                  Text(
                    context.translate(i18.onBoarding.advocateVerificationDesc),
                    style: textTheme.bodyL.copyWith(
                      color: DigitColors().light.textSecondary,
                    ),
                  ),
                  SizedBox(height: spacer12),
                  LabeledField(
                    label: context.translate(
                      i18.onBoarding.stateOfRegistration,
                    ),
                    child: Dropdown(
                      items:
                          ['Maharashtra', 'Punjab', 'Goa', 'Tripura']
                              .asMap()
                              .entries
                              .map(
                                (item) => DropdownItem(
                                  name: item.value,
                                  code: (item.key + 1).toString(),
                                ),
                              )
                              .toList(),
                    ),
                  ),
                  const SizedBox(height: spacer5),
                  InputField(
                    type: InputType.text,
                    label: context.translate(i18.onBoarding.barRegNo),
                    controller: TextEditingController(),
                    // charCount: true,
                  ),
                  const SizedBox(height: spacer5),
                  LabeledField(
                    label: context.translate(i18.onBoarding.uploadBarCounsilId),
                    child: FileUploadWidget(
                      label: context.translate(i18.onBoarding.upload),
                      onFilesSelected: (List<PlatformFile> files) {
                        Map<PlatformFile, String?> fileErrors = {};
                        return fileErrors;
                      },
                      allowMultiples: true,
                      showPreview: true,
                    ),
                  ),
                  const SizedBox(height: spacer5),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
