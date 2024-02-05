

import 'package:fluro/fluro.dart';
import 'package:flutter/widgets.dart';
import 'package:pahlevikun.github.io/presentation/landing/landing_page.dart';

class AppRouteRegistry {
  final FluroRouter router;

  AppRouteRegistry(this.router);

  initRouter() {
    router.define(
      landing,
      handler: Handler(
        handlerFunc: (
          BuildContext? context,
          Map<String, List<String>> parameters,
        ) {
          return LandingPage();
        },
      ),
    );
  }

  static const landing = "/landing";
}
