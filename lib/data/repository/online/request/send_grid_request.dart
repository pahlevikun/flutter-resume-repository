class SendGridRequest {
  String email;
  String subject;
  String name;
  String message;

  SendGridRequest(this.email, this.subject, this.name, this.message);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "personalizations": [
        {
          "to": [
            {"email": "pahlevi.kun@gmail.com"}
          ]
        }
      ],
      "from": {"email": "pahlevikun.id@gmail.com"},
      "subject": subject,
      "content": [
        {"type": "text/plain", "value": "$name - ($email)\\n$message"}
      ]
    };
  }
}
