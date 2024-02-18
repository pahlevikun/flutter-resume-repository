
class Experience {
  final String title;
  final String? company;
  final String duration;
  final String image;
  final String description;
  final String employmentStatus;
  final List<String>? responsibility;
  final List<String>? workResult;
  Experience({
    required this.title,
    required this.duration,
    required this.image,
    required this.description,
    required this.employmentStatus,
    this.company,
    this.responsibility,
    this.workResult,
    this.nested,
  });

  final List<Experience>? nested;
}
