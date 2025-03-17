import 'package:digit_assignment/blocs/app_initialization/app_initialization.dart';
import 'package:digit_assignment/blocs/localization/localization.dart';
import 'package:digit_assignment/blocs/onboarding/onboarding_bloc.dart';
import 'package:digit_assignment/blocs/splash/splash_bloc.dart';
import 'package:digit_assignment/data/app_shared_preferences.dart';
import 'package:digit_assignment/data/local_store/nosql/localization.dart';
import 'package:digit_assignment/data/local_store/remote_client.dart';
import 'package:digit_assignment/router/app_router.dart';
import 'package:digit_assignment/utils/colors.dart';
import 'package:digit_assignment/utils/constants.dart';
import 'package:digit_assignment/utils/env_config.dart';
import 'package:digit_data_model/data_model.init.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/ComponentTheme/button_theme.dart';
import 'package:digit_ui_components/utils/app_logger.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:isar/isar.dart';

late Isar _isar;
late Dio _dio;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initializeMappers();
  await envConfig.initialize();
  _dio = DioClient().dio;
  _isar = await Constants().isar;
  await AppSharedPreferences().init();

  if (AppSharedPreferences().isFirstLaunch) {
    AppLogger.instance.info('App Launched First Time', title: 'main');

    await AppSharedPreferences().appLaunchedFirstTime();
  }

  await EnvironmentConfiguration.instance.initialize();
  runApp(MainApp(isar: _isar));
}

class MainApp extends StatefulWidget {
  final Isar isar;
  const MainApp({super.key, required this.isar});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final _approuter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create:
                (context) =>
                    AppInitialization()..add(const InitEvent.onLaunch()),
          ),
          BlocProvider(create: (context) => SplashBloc()),
          BlocProvider(create: (context) => OnboardingBloc()),
        ],
        child: BlocBuilder<AppInitialization, InitState>(
          builder:
              (context, state) => state.maybeWhen(
                orElse:
                    () => Scaffold(
                      backgroundColor:
                          DigitTheme.instance.colorScheme.onTertiary,
                      body: const Center(child: CircularProgressIndicator()),
                    ),
                initialized: (appConfig, serviceRegistryModel) {
                  final config = appConfig.appConfig?.appConfig!.first;

                  final initialModuleList = config?.backendInterface;
                  final languages = config?.languages;
                  var firstLanguage;
                  firstLanguage = languages?.last.value;

                  // Get the selected locale from shared preferences, or fallback to the default firstLanguage
                  return BlocProvider(
                    create:
                        (context) => LocalizationBloc(widget.isar)..add(
                          LocalizationEvent.onSelect(
                            locale: firstLanguage,
                            moduleList: initialModuleList,
                          ),
                        ),
                    child: BlocBuilder<LocalizationBloc, LocalizationState>(
                      builder: (context, state) {
                        final selectedLocale =
                            AppSharedPreferences().getSelectedLocale ??
                            firstLanguage;
                        return MaterialApp.router(
                          scaffoldMessengerKey: scaffoldMessengerKey,
                          theme: DigitTheme.instance.mobileTheme.copyWith(
                            primaryColor: KColors.primary,
                            textSelectionTheme: TextSelectionThemeData(
                              //cursorColor: KColors.primary,
                              selectionColor: KColors.primary.withOpacity(0.3),
                              selectionHandleColor: KColors.primary,
                            ),
                            extensions: <ThemeExtension<dynamic>>[
                              DigitButtonThemeData.defaultTheme(
                                context,
                              ).copyWith(DigitButtonColor: KColors.primary),
                              // Add other theme extensions if needed
                            ],
                          ),
                          routerDelegate: _approuter.delegate(),
                          routeInformationParser:
                              _approuter.defaultRouteParser(),
                          supportedLocales:
                              languages != null
                                  ? languages.map((e) {
                                    final results = e.value.split('_');
                                    return results.length >= 2
                                        ? Locale(results.first, results.last)
                                        : const Locale('en', 'US');
                                  }).toList()
                                  : const [Locale('en', 'US')],
                          localizationsDelegates: [
                            // AppLocalizations.getDelegate(
                            //   appConfig.appConfig!,
                            //   widget.isar,
                            // ),
                            GlobalWidgetsLocalizations.delegate,
                            GlobalCupertinoLocalizations.delegate,
                            GlobalMaterialLocalizations.delegate,
                          ],
                          locale:
                              (languages != null &&
                                      selectedLocale != null &&
                                      selectedLocale.contains('_'))
                                  ? Locale(
                                    selectedLocale.split("_").first,
                                    selectedLocale.split("_").last,
                                  )
                                  : const Locale('en', 'US'),
                        );
                      },
                    ),
                  );
                },
              ),
        ),
      ),
    );
  }
}

Future<List<dynamic>> getLocalizationString(
  Isar isar,
  String selectedLocale,
) async {
  // Initialize an empty list to store localization values
  List<dynamic> localizationValues = [];

  // Query Isar database to fetch localization wrappers for the selected locale
  final List<LocalizationWrapper> localizationList =
      await isar.localizationWrappers
          .filter()
          .localeEqualTo(selectedLocale.toString())
          .findAll();

  // Check if localization wrappers are found for the selected locale
  if (localizationList.isNotEmpty) {
    // Add localization values to the list if found
    localizationValues.addAll(localizationList.first.localization!);
  }

  // Return the fetched localization values
  return localizationValues;
}
