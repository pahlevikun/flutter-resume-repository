

import 'package:fluro/fluro.dart';
import 'package:injectable/injectable.dart';
import 'package:pahlevikun.github.io/router/app_route_registry.dart';
import 'package:pahlevikun.github.io/router/navigation_dispatcher.dart';

@module
abstract class RouterModule {
  @Singleton()
  FluroRouter provideFluroRouter() => FluroRouter.appRouter;

  @Singleton()
  AppRouteRegistry provideInternalRouter(FluroRouter router) =>
      AppRouteRegistry(router);

  @Singleton()
  NavigationDispatcher provideNavigationDispatcher(FluroRouter router) =>
      NavigationDispatcher(router);
}
