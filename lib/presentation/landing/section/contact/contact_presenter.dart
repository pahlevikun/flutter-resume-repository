import 'package:pahlevikun.github.io/dependencies/locator/application_locator.dart';
import 'package:pahlevikun.github.io/domain/usecase/get_medium_stories_usecase.dart';
import 'package:pahlevikun.github.io/domain/usecase/send_mail_usecase.dart';
import 'package:pahlevikun.github.io/presentation/landing/section/blog/blog_contract.dart';
import 'package:pahlevikun.github.io/presentation/landing/section/contact/contact_contract.dart';

class ContactPresenter {
  final ContactContract view;
  final _useCase = locator<SendMailUseCase>();

  ContactPresenter(this.view);

  void sendMail(String email, subject, name, message) {
    view.showLoading();
    _useCase.sendMail(email, subject, name, message).then((response) {
      if (response == true) {
        view.successSentMail();
      } else {
        view.failedSentMail();
      }
    }).catchError((error) {
      view.failedSentMail();
    });
  }
}
