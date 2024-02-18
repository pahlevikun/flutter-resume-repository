import 'package:dio/dio.dart' hide Headers;
import 'package:pahlevikun.github.io/config/build_config.dart';
import 'package:pahlevikun.github.io/data/source/remote/service/model/request/mailer_request.dart';
import 'package:retrofit/http.dart';

part 'mailer_api_service.g.dart';

@RestApi(baseUrl: BuildConfig.MAILER_END_POINT)
abstract class MailerApiService {
  factory MailerApiService(Dio dio, {String baseUrl}) = _MailerApiService;

  @POST("php/mailer.php")
  Future<void> sendEmail({
    @Body() required MailerRequest request,
  });
}
