import 'package:digit_assignment/blocs/splash/splash_bloc.dart';
import 'package:digit_assignment/router/app_router.dart';
import 'package:digit_assignment/utils/asset_images.dart';
import 'package:digit_assignment/utils/extensions.dart';
import 'package:digit_assignment/utils/i18_key_constants.dart' as i18;
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    context.read<SplashBloc>().add(const SplashEvent.loadingSplash());
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.digitTextTheme(context);

    return BlocListener<SplashBloc, SplashState>(
      listener: (context, state) {
        if (state is SplashLoaded) {
          context.router.popAndPush(AboutSelectionRoute());
        }
      },
      child: Scaffold(
        backgroundColor: DigitTheme.instance.colorScheme.onTertiary,
        appBar: AppBar(
          backgroundColor: DigitTheme.instance.colorScheme.onTertiary,
          centerTitle: true,
          title: Text(
            context.translate(i18.splash.title),
            style: textTheme.headingL.copyWith(color: theme.primaryColor),
          ),
        ),

        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: context.height * 0.25),
              SizedBox(
                width: context.width * 0.2,
                child: Image.asset(
                  AssetImages.GOVT_OF_IND_LOGO,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: spacer4),
              Text(
                context.translate(i18.splash.getStartedOnMobile),
                style: textTheme.headingM,
              ),
              SizedBox(height: spacer2),
              Text(
                context.translate(i18.splash.optimizedExperience),
                style: textTheme.bodyL,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
