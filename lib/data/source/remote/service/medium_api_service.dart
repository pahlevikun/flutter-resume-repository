import 'package:dio/dio.dart' hide Headers;
import 'package:pahlevikun.github.io/config/build_config.dart';
import 'package:pahlevikun.github.io/data/source/remote/service/model/response/medium_response.dart';
import 'package:retrofit/http.dart';

part 'medium_api_service.g.dart';

@RestApi(baseUrl: BuildConfig.RSS_END_POINT)
abstract class MediumApiService {
  factory MediumApiService(Dio dio, {String baseUrl}) = _MediumApiService;

  @POST("v1/api.json")
  Future<MediumResponse> getMediumFeeds({
    @Query("rss_url", encoded: false) required String query,
  });
}
