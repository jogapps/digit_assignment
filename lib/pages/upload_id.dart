import 'package:digit_assignment/router/app_router.dart';
import 'package:digit_assignment/utils/extensions.dart';
import 'package:digit_assignment/utils/i18_key_constants.dart' as i18;
import 'package:digit_assignment/widgets/layouts/onboarding_layout.dart';
import 'package:digit_assignment/widgets/texts/title_desc.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/widgets/atoms/dropdown_wrapper.dart';
import 'package:digit_ui_components/widgets/atoms/upload_popUp.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

@RoutePage()
class UploadIDPage extends StatefulWidget {
  const UploadIDPage({super.key});

  @override
  State<UploadIDPage> createState() => _UploadIDPageState();
}

class _UploadIDPageState extends State<UploadIDPage> {
  @override
  Widget build(BuildContext context) {
    return OnBoardingLayout(
      onPressed: () => context.router.push(TermsAndConditionsRoute()),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: spacer4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppTitleDesc(
                context: context,
                title: context.translate(i18.onBoarding.uploadYourId),
                desc: context.translate(i18.onBoarding.uploadYourIdDesc),
              ),
              const SizedBox(height: spacer12),
              LabeledField(
                label: context.translate(i18.onBoarding.typeOfId),
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
              LabeledField(
                label: context.translate(i18.onBoarding.uploadIdProof),
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
            ],
          ),
        ),
      ],
    );
  }
}
