import 'package:injectable/injectable.dart';
import 'package:pahlevikun.github.io/data/source/remote/remote_gateway.dart';
import 'package:pahlevikun.github.io/data/source/remote/service/mailer_api_service.dart';
import 'package:pahlevikun.github.io/data/source/remote/service/medium_api_service.dart';

@module
abstract class RemoteModule {
  @Singleton()
  RemoteGateway provideRemoteGateway(
    @Named("mailer_api_service") MailerApiService mailerApiService,
    @Named("medium_api_service") MediumApiService mediumApiService,
  ) {
    return RemoteGateway(mailerApiService, mediumApiService);
  }

}
