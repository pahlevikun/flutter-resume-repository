import 'package:pahlevikun.github.io/config/build_config.dart';
import 'package:pahlevikun.github.io/data/source/remote/service/mailer_api_service.dart';
import 'package:pahlevikun.github.io/data/source/remote/service/medium_api_service.dart';
import 'package:pahlevikun.github.io/data/source/remote/service/model/request/mailer_request.dart';
import 'package:pahlevikun.github.io/data/source/remote/service/model/response/medium_response.dart';
import 'package:rxdart_ext/rxdart_ext.dart';

class RemoteGateway {
  final MailerApiService _mailerApiService;
  final MediumApiService _mediumApiService;

  RemoteGateway(this._mailerApiService, this._mediumApiService);

  Single<void> sendEmail({
    required MailerRequest request,
  }) {
    return Single.fromFuture(_mailerApiService.sendEmail(request: request));
  }

  Single<MediumResponse> getMediumFeeds() {
    final String query = "https://medium.com/feed/@${BuildConfig.MEDIUM_ACCOUNT}";
    return Single.fromFuture(_mediumApiService.getMediumFeeds(query: query));
  }


}
