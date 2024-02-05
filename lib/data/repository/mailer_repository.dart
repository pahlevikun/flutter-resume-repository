import 'package:pahlevikun.github.io/data/source/local/local_gateway.dart';
import 'package:pahlevikun.github.io/data/source/remote/remote_gateway.dart';
import 'package:pahlevikun.github.io/data/source/remote/service/model/request/mailer_request.dart';
import 'package:pahlevikun.github.io/domain/contract/mailer_repository_contract.dart';
import 'package:pahlevikun.github.io/domain/contract/resume_repository_contract.dart';
import 'package:pahlevikun.github.io/domain/model/email.dart';
import 'package:pahlevikun.github.io/domain/model/resume.dart';
import 'package:rxdart_ext/rxdart_ext.dart';

class MailerRepositoryImpl implements MailerRepository {
  final RemoteGateway _remoteGateway;

  MailerRepositoryImpl(
    this._remoteGateway,
  );

  @override
  Single<void> sendEmail({required Email email}) {
    return _remoteGateway.sendEmail(
      request: MailerRequest(
        email: email.email,
        subject: email.subject,
        name: email.name,
        message: email.message,
      ),
    );
  }
}
