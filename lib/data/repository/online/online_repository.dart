import 'package:dio/dio.dart';
import 'package:pahlevikun.github.io/data/repository/online/response/medium_response.dart';
import 'package:pahlevikun.github.io/dependencies/locator/application_locator.dart';
import 'package:pahlevikun.github.io/dependencies/module/network_module.dart';

abstract class ApiServiceRepository {
  Future<MediumResponse> getMediumStories(String username);
}

class OnlineServiceManager implements ApiServiceRepository {
  final Dio _dio = (locator<NetworkModule>()).buildDio();

  static const String GET_MEDIUM_END_POINT =
      "https://api.rss2json.com/v1/api.json?rss_url=https://medium.com/feed/@";

  @override
  Future<MediumResponse> getMediumStories(String username) async {
    try {
      Response response = await _dio.get(GET_MEDIUM_END_POINT + username);
      return MediumResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return null;
    }
  }
}
