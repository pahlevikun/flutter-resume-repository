import 'package:pahlevikun.github.io/data/repository/online/online_repository.dart';
import 'package:pahlevikun.github.io/dependencies/module/network_module.dart';

import 'application_locator.dart';

class RepositoryLocator {
  static Future setupRepositoryLocator() async {
    _addOnlineRepository();
  }

  static _addOnlineRepository() {
    final network = OnlineServiceManager();
    locator.registerSingleton(network);
  }
}
