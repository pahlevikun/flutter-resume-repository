import 'package:pahlevikun.github.io/domain/model/skill.dart';

class Expertise {
  final String title;
  final String body;
  final List<Skill> skills;

  Expertise({
    required this.title,
    required this.body,
    required this.skills,
  });
}
