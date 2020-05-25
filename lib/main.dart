import 'dart:developer';

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:pahlevikun.github.io/common/theme/base_theme.dart';
import 'package:pahlevikun.github.io/common/theme/theme.dart';
import 'package:pahlevikun.github.io/presentation/landing/landing_page.dart';
import 'package:pahlevikun.github.io/presentation/resume/resume_data.dart';

import 'build_config.dart';
import 'common/widget/restart_widget.dart';
import 'dependencies/locator/application_locator.dart';
import 'dependencies/locator/repository_locator.dart';
import 'dependencies/locator/usecase_locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await ApplicationLocator.setupApplicationLocator();
    await RepositoryLocator.setupRepositoryLocator();
    await UseCaseLocator.setupUseCaseLocator();
    runApp(RestartWidget(
      child: PahleviTheme(
          initialThemeKey: PahleviThemeOption.DEFAULT, child: App()),
    ));
  } catch (error) {
    log('Locator setup has failed >> $error');
  }
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var router = locator<Router>();
    _initRouter(router);

    return MaterialApp(
      title: ResumeData.getData().webTitle,
      theme: PahleviThemePicker.getTheme(),
      debugShowCheckedModeBanner: BuildConfig.isDebugMode,
      home: LandingPage(),
      onGenerateRoute: router.generator,
    );
  }

  void _initRouter(Router router) {
    router.define(ROUTE_LANDING, handler: Handler(
        handlerFunc: (BuildContext context, Map<String, dynamic> params) {
      return LandingPage();
    }));
  }
}

const ROUTE_LANDING = "/landing";
