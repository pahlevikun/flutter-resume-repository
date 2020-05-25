import 'package:pahlevikun.github.io/data/repository/online/online_repository.dart';
import 'package:pahlevikun.github.io/data/repository/online/response/medium_response.dart';

class GetMediumStoriesUseCase {
  final OnlineServiceManager _onlineServiceManager;

  GetMediumStoriesUseCase(this._onlineServiceManager);

  Future<MediumResponse> getMediumStories() {
    String username = "pahlevikun";
    return _onlineServiceManager.getMediumStories(username);
  }
}
