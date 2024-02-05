import 'package:flutter/widgets.dart';

class Experience {
  final String title;
  final String company;
  final String duration;
  final String image;
  final String description;
  final List<Experience>? nested;

  Experience({
    required this.title,
    required this.company,
    required this.duration,
    required this.image,
    required this.description,
    this.nested,
  });
}
