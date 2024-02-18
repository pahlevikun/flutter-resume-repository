import 'package:injectable/injectable.dart';
import 'package:pahlevikun.github.io/data/repository/mailer_repository.dart';
import 'package:pahlevikun.github.io/data/repository/medium_repository.dart';
import 'package:pahlevikun.github.io/data/repository/resume_repository.dart';
import 'package:pahlevikun.github.io/data/source/local/local_gateway.dart';
import 'package:pahlevikun.github.io/data/source/remote/remote_gateway.dart';
import 'package:pahlevikun.github.io/domain/contract/mailer_repository_contract.dart';
import 'package:pahlevikun.github.io/domain/contract/mailer_repository_contract.dart';
import 'package:pahlevikun.github.io/domain/contract/mailer_repository_contract.dart';
import 'package:pahlevikun.github.io/domain/contract/medium_repository_contract.dart';
import 'package:pahlevikun.github.io/domain/contract/resume_repository_contract.dart';

@module
abstract class RepositoryModule {

  @Singleton()
  ResumeRepository provideResumeRepository(
    LocalGateway gateway,
  ) {
    return ResumeRepositoryImpl(
      gateway,
    );
  }

  @Singleton()
  MediumRepository provideMediumRepository(
    RemoteGateway gateway,
  ) {
    return MediumRepositoryImpl(
      gateway,
    );
  }

  @Singleton()
  MailerRepository provideMailerRepository(
    RemoteGateway gateway,
  ) {
    return MailerRepositoryImpl(
      gateway,
    );
  }
}
