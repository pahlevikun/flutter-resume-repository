import 'package:pahlevikun.github.io/data/repository/online/online_repository.dart';
import 'package:pahlevikun.github.io/domain/usecase/get_medium_stories_usecase.dart';
import 'package:pahlevikun.github.io/domain/usecase/send_mail_usecase.dart';

import 'application_locator.dart';

class UseCaseLocator {
  static Future setupUseCaseLocator() async {
    final onlineServiceManager = locator<OnlineServiceManager>();
    _addGetMediumStoriesUseCase(onlineServiceManager);
    _addSendMailUseCase(onlineServiceManager);
  }

  static _addGetMediumStoriesUseCase(
      OnlineServiceManager onlineServiceManager) {
    var _useCase = GetMediumStoriesUseCase(onlineServiceManager);
    locator.registerSingleton(_useCase);
  }

  static _addSendMailUseCase(OnlineServiceManager onlineServiceManager) {
    var _useCase = SendMailUseCase(onlineServiceManager);
    locator.registerSingleton(_useCase);
  }
}
