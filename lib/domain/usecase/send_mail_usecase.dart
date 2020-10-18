import 'package:pahlevikun.github.io/data/repository/online/online_repository.dart';

class SendMailUseCase {
  final OnlineServiceManager _onlineServiceManager;

  SendMailUseCase(this._onlineServiceManager);

  Future<bool> sendMail(String email, subject, name, message) {
    return _onlineServiceManager.sendEmails(email, subject, name, message);
  }
}
