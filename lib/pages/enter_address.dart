import 'package:auto_route/annotations.dart';
import 'package:digit_assignment/utils/extensions.dart';
import 'package:digit_assignment/utils/i18_key_constants.dart' as i18;
import 'package:digit_assignment/widgets/button/bottom_button.dart';
import 'package:digit_assignment/widgets/header/back_navigation_help_header.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/widgets/atoms/digit_divider.dart';
import 'package:digit_ui_components/widgets/atoms/dropdown_wrapper.dart';
import 'package:digit_ui_components/widgets/atoms/input_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

@RoutePage()
class EnterAddressPage extends StatefulWidget {
  const EnterAddressPage({super.key});

  @override
  State<EnterAddressPage> createState() => _EnterAddressPageState();
}

class _EnterAddressPageState extends State<EnterAddressPage> {
  late GoogleMapController mapController;
  final LatLng _center = const LatLng(37.42796133580664, -122.085749655962);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
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
          footer: BottomButton(onPressed: () => {}),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: spacer4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: spacer12),
                  Text(
                    context.translate(i18.onBoarding.enterYourAddress),
                    style: textTheme.headingM,
                  ),
                  SizedBox(height: spacer2),
                  const SizedBox(height: spacer5),
                  InputField(
                    type: InputType.search,
                    controller: TextEditingController(),
                    innerLabel: context.translate(
                      i18.onBoarding.searchBuildingStreet,
                    ),
                  ),
                  const SizedBox(height: spacer5),
                  SizedBox(
                    height: context.height * 0.2,
                    // child: GoogleMap(
                    //   onMapCreated: _onMapCreated,
                    //   initialCameraPosition: CameraPosition(
                    //     target: _center,
                    //     zoom: 11.0,
                    //   ),
                    //   markers: {
                    //     Marker(
                    //       markerId: const MarkerId("HQ"),
                    //       position: _center,
                    //       infoWindow: const InfoWindow(title: 'Googleplex'),
                    //     ),
                    //   },
                    // ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Light().alertInfoBg,
                      borderRadius: BorderRadius.circular(spacer2),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(spacer2),
                      child: Row(
                        children: [
                          Icon(
                            Icons.info_rounded,
                            size: spacer4,
                            color: Light().alertInfo,
                          ),
                          SizedBox(width: spacer1),
                          Text(
                            "Move the pin to the exact desired location",
                            style: textTheme.bodyL.copyWith(
                              color: DigitColors().light.textSecondary,
                              fontSize: spacer3,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: spacer5),
            DigitDivider(dividerType: DividerType.small),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: spacer4),
              child: Column(
                children: [
                  const SizedBox(height: spacer5),
                  InputField(
                    type: InputType.text,
                    label: context.translate(i18.onBoarding.pinCode),
                    controller: TextEditingController(),
                  ),
                  const SizedBox(height: spacer5),
                  LabeledField(
                    label: context.translate(i18.onBoarding.state),
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
                    label: context.translate(i18.onBoarding.district),
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
                    label: context.translate(i18.onBoarding.cityTown),
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
                    label: context.translate(i18.onBoarding.locality),
                    controller: TextEditingController(),
                  ),
                  const SizedBox(height: spacer5),
                  InputField(
                    type: InputType.text,
                    label: context.translate(i18.onBoarding.building),
                    controller: TextEditingController(),
                  ),
                  const SizedBox(height: spacer7),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
