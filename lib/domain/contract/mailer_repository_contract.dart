

import 'package:pahlevikun.github.io/domain/model/email.dart';
import 'package:rxdart_ext/rxdart_ext.dart';

abstract class MailerRepository {
  Single<void> sendEmail({required Email email});
}
