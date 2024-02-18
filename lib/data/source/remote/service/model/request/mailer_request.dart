import 'package:json_annotation/json_annotation.dart';

part 'mailer_request.g.dart';

@JsonSerializable()
class MailerRequest {
  @JsonKey(name: "email")
  final String email;
  @JsonKey(name: "subject")
  final String subject;
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "message")
  final String message;

  MailerRequest({
    required this.email,
    required this.subject,
    required this.name,
    required this.message,
  });

  factory MailerRequest.fromJson(Map<String, dynamic> json) =>
      _$MailerRequestFromJson(json);

  Map<String, dynamic> toJson() => _$MailerRequestToJson(this);
}