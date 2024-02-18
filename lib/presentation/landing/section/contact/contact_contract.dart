abstract class ContactContract {
  void successSentMail();

  void failedSentMail({
    required String email,
    required String subject,
    required String name,
    required String message,
  });

  void showLoading();
}
