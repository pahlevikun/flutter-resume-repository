class Story {
  final String title;
  final String pubDate;
  final String link;
  final String guid;
  final String author;
  final String thumbnail;
  final String description;
  final List<String> categories;

  Story({
    required this.title,
    required this.pubDate,
    required this.link,
    required this.guid,
    required this.author,
    required this.thumbnail,
    required this.description,
    required this.categories,
  });
}
