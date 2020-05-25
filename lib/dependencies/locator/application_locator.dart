import 'package:fluro/fluro.dart';
import 'package:get_it/get_it.dart';
import 'package:pahlevikun.github.io/common/event/global_event_helper.dart';
import 'package:pahlevikun.github.io/dependencies/module/network_module.dart';

GetIt locator = GetIt.instance;

class ApplicationLocator {
  static Future setupApplicationLocator() async {
    _addRouter();
    _addEventBus();
    _addOnlineRepository();
  }

  static _addEventBus() {
    final eventBus = RxBus();
    locator.registerSingleton(eventBus);
  }

  static _addRouter() {
    var _router = Router();
    locator.registerSingleton(_router);
  }

  static _addOnlineRepository() {
    final network = NetworkModule();
    locator.registerSingleton(network);
  }
}
