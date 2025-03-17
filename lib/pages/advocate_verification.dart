import 'package:digit_assignment/router/app_router.dart';
import 'package:digit_assignment/utils/extensions.dart';
import 'package:digit_assignment/utils/i18_key_constants.dart' as i18;
import 'package:digit_assignment/widgets/layouts/onboarding_layout.dart';
import 'package:digit_assignment/widgets/texts/title_desc.dart';
import 'package:digit_ui_components/models/DropdownModels.dart';
import 'package:digit_ui_components/theme/spacers.dart';
import 'package:digit_ui_components/widgets/atoms/dropdown_wrapper.dart';
import 'package:digit_ui_components/widgets/atoms/input_wrapper.dart';
import 'package:digit_ui_components/widgets/atoms/labelled_fields.dart';
import 'package:digit_ui_components/widgets/atoms/upload_popUp.dart';
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
    return OnBoardingLayout(
      onPressed: () => context.router.push(EnterNameRoute()),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: spacer4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppTitleDesc(
                context: context,
                title: context.translate(i18.onBoarding.advocateVerification),
                desc: context.translate(
                  i18.onBoarding.advocateVerificationDesc,
                ),
              ),
              SizedBox(height: spacer12),
              LabeledField(
                label: context.translate(i18.onBoarding.stateOfRegistration),
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
    );
  }
}
