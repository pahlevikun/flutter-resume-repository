import 'package:pahlevikun.github.io/di/injector.dart';
import 'package:pahlevikun.github.io/domain/model/email.dart';
import 'package:pahlevikun.github.io/domain/usecase/send_mail_usecase.dart';
import 'package:pahlevikun.github.io/presentation/landing/section/contact/contact_contract.dart';
import 'package:rxdart_ext/rxdart_ext.dart';

class ContactPresenter {
  final ContactContract view;
  final _useCase = Injector.locator<SendMailUseCase>();

  ContactPresenter({required this.view});

  void sendMail({
    required String email,
    required String subject,
    required String name,
    required String message,
  }) {
    Single.fromCallable(() => view.showLoading()).flatMap((value) {
      final param = Email(
        email: email,
        subject: subject,
        name: name,
        message: message,
      );
      return _useCase.execute(param);
    }).listen(
      (value) {
        view.successSentMail();
      },
      onError: (error) {
        view.failedSentMail(
          email: email,
          subject: subject,
          name: name,
          message: message,
        );
      },
    );
  }
}
