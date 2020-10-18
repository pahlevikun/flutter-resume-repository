import 'package:dio/dio.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:pahlevikun.github.io/data/repository/online/response/medium_response.dart';
import 'package:pahlevikun.github.io/dependencies/locator/application_locator.dart';
import 'package:pahlevikun.github.io/dependencies/module/network_module.dart';

abstract class ApiServiceRepository {
  Future<MediumResponse> getMediumStories(String username);

  Future<bool> sendEmails(
      String email, String subject, String name, String message);
}

// Later change dio to basic http request,
class OnlineServiceManager implements ApiServiceRepository {
  final Dio _dio = (locator<NetworkModule>()).buildDio();

  static const String GET_MEDIUM_END_POINT =
      "https://api.rss2json.com/v1/api.json?rss_url=https://medium.com/feed/@";
  static const String POST_SEND_GRID_END_POINT =
      "http://localhost:57110/php/mailer.php";

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

  @override
  Future<bool> sendEmails(
      String email, String subject, String name, String message) async {
    try {
      Response response = await _dio.post(POST_SEND_GRID_END_POINT, data: {
        "email": email,
        "subject": subject,
        "name": name,
        "message": message
      });
      return true;
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return false;
    }
  }
}
