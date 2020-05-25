import 'package:pahlevikun.github.io/data/repository/online/response/medium_response.dart';

abstract class BlogContract {
  void setStories(List<Story> items);
  void showLoading();
  void showError();
}
