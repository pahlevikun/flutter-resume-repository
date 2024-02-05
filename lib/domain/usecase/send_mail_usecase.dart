import 'package:injectable/injectable.dart';
import 'package:pahlevikun.github.io/domain/contract/mailer_repository_contract.dart';
import 'package:pahlevikun.github.io/domain/contract/usecase.dart';
import 'package:pahlevikun.github.io/domain/model/email.dart';
import 'package:rxdart_ext/rxdart_ext.dart';

@Singleton()
class SendMailUseCase extends UseCase<Email, Single<void>> {
  final MailerRepository _repository;

  SendMailUseCase(this._repository);

  @override
  Single<void> execute(Email param) {
    return _repository.sendEmail(email: param);
  }
}
