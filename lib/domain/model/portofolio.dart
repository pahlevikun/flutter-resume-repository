import 'package:flutter/foundation.dart';

class Portfolio {
  final String title;
  final String description;
  final PortoType type;
  final List<String> tech;
  final PortoWorks work;
  final String? link;
  final String? award;
  final String? industry;

  Portfolio({
    required this.title,
    required this.description,
    required this.type,
    required this.tech,
    required this.work,
    this.link,
    this.award,
    this.industry,
  });
}

enum PortoWorks { PERSONAL_PROJECT, OFFICE_TASK, OPEN_SOURCE }

enum PortoType { ANDROID, IOS, FLUTTER, WEB_FRONT_END, WEB_BACK_END }

class PortoTech {
  static const String JAVA = "Java";
  static const String KOTLIN = "Kotlin";
  static const String SWIFT = "Swift";
  static const String PHP = "Php";
  static const String LARAVEL = "Laravel";
  static const String SQL = "SQL";
  static const String JAVASCRIPT = "JavaScript";
  static const String CSS = "Css";
  static const String HTML = "Html";
  static const String BOOTSTRAP = "Bootstrap";
  static const String DART = "Dart";
  static const String FLUTTER = "Flutter";
}
