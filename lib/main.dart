import 'dart:developer';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pahlevikun.github.io/config/color_config.dart';
import 'package:pahlevikun.github.io/di/injector.dart';
import 'package:pahlevikun.github.io/domain/usecase/get_resume_data_usecase.dart';
import 'package:pahlevikun.github.io/presentation/landing/landing_page.dart';
import 'package:pahlevikun.github.io/presentation/widget/restart_widget.dart';
import 'package:pahlevikun.github.io/router/app_route_registry.dart';

import 'config/build_config.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await configureInjection();
    runApp(
      RestartWidget(
        child: App(),
      ),
    );
  } catch (error) {
    log('Locator setup has failed >> $error');
  }
}

class App extends StatefulWidget {
  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final _route = Injector.locator<AppRouteRegistry>();
  final _useCase = Injector.locator<GetResumeDataUseCase>();

  @override
  void initState() {
    super.initState();
    _route.initRouter();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return AdaptiveTheme(
      light: ThemeData(
        textTheme: GoogleFonts.latoTextTheme(textTheme),
        brightness: Brightness.light,
        primarySwatch: MaterialColor(
          ColorConfig.LIGHT_PRIMARY_RED.toHex(),
          <int, Color>{
            50: ColorConfig.LIGHT_10_RED.toColor(),
            100: ColorConfig.LIGHT_20_RED.toColor(),
            200: ColorConfig.LIGHT_30_RED.toColor(),
            300: ColorConfig.LIGHT_40_RED.toColor(),
            400: ColorConfig.LIGHT_50_RED.toColor(),
            500: ColorConfig.LIGHT_60_RED.toColor(),
            600: ColorConfig.LIGHT_70_RED.toColor(),
            700: ColorConfig.LIGHT_80_RED.toColor(),
            800: ColorConfig.LIGHT_90_RED.toColor(),
            900: ColorConfig.LIGHT_100_RED.toColor(),
          },
        ),
        backgroundColor: ColorConfig.LIGHT_BACKGROUND.toColor(),
      ),
      dark: ThemeData(
        textTheme: GoogleFonts.latoTextTheme(textTheme),
        brightness: Brightness.dark,
        primarySwatch: MaterialColor(
          ColorConfig.DARK_PRIMARY_RED.toHex(),
          <int, Color>{
            50: ColorConfig.DARK_10_RED.toColor(),
            100: ColorConfig.DARK_20_RED.toColor(),
            200: ColorConfig.DARK_30_RED.toColor(),
            300: ColorConfig.DARK_40_RED.toColor(),
            400: ColorConfig.DARK_50_RED.toColor(),
            500: ColorConfig.DARK_60_RED.toColor(),
            600: ColorConfig.DARK_70_RED.toColor(),
            700: ColorConfig.DARK_80_RED.toColor(),
            800: ColorConfig.DARK_90_RED.toColor(),
            900: ColorConfig.DARK_100_RED.toColor(),
          },
        ),
        backgroundColor: ColorConfig.DARK_BACKGROUND.toColor(),
      ),
      initial: AdaptiveThemeMode.light,
      builder: (theme, darkTheme) {
        return MaterialApp(
          title: _useCase.execute({}).webTitle,
          debugShowCheckedModeBanner: BuildConfig.BUILD_LOG_ENABLED_MODE && !kReleaseMode,
          theme: theme,
          darkTheme: darkTheme,
          home: LandingPage(),
          onGenerateRoute: _route.router.generator,
        );
      },
    );
  }
}
