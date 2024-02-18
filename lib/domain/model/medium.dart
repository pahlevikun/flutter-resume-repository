import 'package:pahlevikun.github.io/domain/model/feed.dart';
import 'package:pahlevikun.github.io/domain/model/story.dart';

class Medium {
  final String status;
  final Feed feed;
  final List<Story> items;

  Medium({
    required this.status,
    required this.feed,
    required this.items,
  });
}