import 'package:auto_route/auto_route.dart';
import 'package:digit_assignment/pages/about_selection.dart';
import 'package:digit_assignment/pages/advocate_verification.dart';
import 'package:digit_assignment/pages/completion.dart';
import 'package:digit_assignment/pages/enter_aadhaar.dart';
import 'package:digit_assignment/pages/enter_address.dart';
import 'package:digit_assignment/pages/enter_email.dart';
import 'package:digit_assignment/pages/enter_mobile.dart';
import 'package:digit_assignment/pages/enter_name.dart';
import 'package:digit_assignment/pages/splash.dart';
import 'package:digit_assignment/pages/terms_and_conditions.dart';
import 'package:digit_assignment/pages/unauthenticated.dart';
import 'package:digit_assignment/pages/upload_id.dart';
import 'package:digit_assignment/pages/vierify_identity.dart';
import 'package:digit_assignment/router/routes.dart';

export 'package:auto_route/auto_route.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(modules: [])
class AppRouter extends _$AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      page: UnauthenticatedRouteWrapper.page,
      path: '/',
      children: [
        AutoRoute(page: SplashRoute.page, initial: true, path: Routes.splash),
        AutoRoute(page: AboutSelectionRoute.page, path: Routes.aboutSelection),
        AutoRoute(page: EnterMobileRoute.page, path: Routes.enterMobile),
        AutoRoute(
          page: AdvocateVerificationRoute.page,
          path: Routes.advocateVerification,
        ),
        AutoRoute(page: EnterNameRoute.page, path: Routes.enterName),
        AutoRoute(page: EnterEmailRoute.page, path: Routes.enterEmail),
        AutoRoute(page: EnterAddressRoute.page, path: Routes.enterAddress),
        AutoRoute(page: VerifyIdentityRoute.page, path: Routes.verifyIdentity),
        AutoRoute(page: EnterAadhaarRoute.page, path: Routes.enterAadhaar),
        AutoRoute(page: UploadIDRoute.page, path: Routes.uploadID),
        AutoRoute(
          page: TermsAndConditionsRoute.page,
          path: Routes.termsAndConditions,
        ),
        AutoRoute(page: CompletionRoute.page, path: Routes.completion),
      ],
    ),
  ];
}
