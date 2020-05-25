import 'package:pahlevikun.github.io/dependencies/locator/application_locator.dart';
import 'package:pahlevikun.github.io/domain/usecase/get_medium_stories_usecase.dart';
import 'package:pahlevikun.github.io/presentation/landing/section/blog/blog_contract.dart';

class BlogPresenter {
  final BlogContract view;
  final _useCase = locator<GetMediumStoriesUseCase>();

  BlogPresenter(this.view);

  void fetchData() {
    view.showLoading();
    Future.delayed(const Duration(seconds: 3), () {
      _useCase.getMediumStories().then((response) {
        if (response != null) {
          view.setStories(response.items
              .where((element) => element.categories.length != 0)
              .toList());
        } else {
          view.showError();
        }
      }).catchError((error) {
        view.showError();
      });
    });
  }
}
