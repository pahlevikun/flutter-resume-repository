import 'package:flutter/widgets.dart';

class Award {
  String title;
  String year;
  String institution;
  String description;
  String type;

  Award(
      {@required this.title,
      @required this.year,
      @required this.institution,
      @required this.description,
      @required this.type});
}
