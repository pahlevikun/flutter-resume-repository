import 'package:flutter/foundation.dart';

class Porto {
  String title;
  String description;
  PortoType type;
  List<PortoTech> tech;
  PortoWorks work;
  String year;
  String link;
  String award;
  String industry;

  Porto(
      {@required this.title,
      @required this.description,
      @required this.type,
      @required this.tech,
      @required this.year,
      @required this.work,
      this.link,
      this.award,
      this.industry});
}

enum PortoWorks { PERSONAL, OFFICE, OPEN_SOURCE }

enum PortoType { ANDROID, IOS, FLUTTER, WEB_FRONT_END, WEB_BACK_END }

enum PortoTech {
  JAVA,
  KOTLIN,
  SWIFT,
  PHP,
  LARAVEL,
  SQL,
  JAVASCRIPT,
  CSS,
  HTML,
  BOOTSTRAP,
  DART,
  FLUTTER
}
