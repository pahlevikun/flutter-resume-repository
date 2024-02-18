import 'package:pahlevikun.github.io/domain/model/story.dart';

abstract class BlogContract {
  void setStories(List<Story> items);

  void showLoading();

  void showError();
}
