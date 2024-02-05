import 'package:fluro/fluro.dart';
import 'package:flutter/widgets.dart';
import 'package:pahlevikun.github.io/router/app_route_registry.dart';

class NavigationDispatcher {
  final FluroRouter _router;

  NavigationDispatcher(this._router);

  Future<dynamic> _goToPath(
    BuildContext context,
    String path, {
    bool clearStack = false,
    TransitionType transition = TransitionType.fadeIn,
    RouteSettings? routeSettings,
  }) async {
    return _router.navigateTo(
      context,
      path,
      clearStack: clearStack,
      transition: transition,
      routeSettings: routeSettings,
    );
  }

  void back(context, {dynamic result}) {
    _router.pop(context, result);
  }

  pop(BuildContext context) {
    Navigator.pop(context);
  }

  Future<dynamic> goToLanding(BuildContext context) async {
    return _goToPath(
      context,
      AppRouteRegistry.landing,
      clearStack: true,
    );
  }
}
