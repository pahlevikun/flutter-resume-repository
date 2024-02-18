import 'package:pahlevikun.github.io/di/injector.dart';
import 'package:pahlevikun.github.io/domain/usecase/get_medium_stories_usecase.dart';
import 'package:pahlevikun.github.io/presentation/landing/section/blog/blog_contract.dart';
import 'package:rxdart_ext/rxdart_ext.dart';

class BlogPresenter {
  final BlogContract view;
  final _useCase = Injector.locator<GetMediumStoriesUseCase>();

  BlogPresenter({required this.view});

  void fetchData() {
    Single.fromCallable(() => view.showLoading())
        .delay(Duration(seconds: 1))
        .flatMap((value) => _useCase.execute({}))
        .delay(Duration(seconds: 1))
        .listen(
      (value) {
        if (value.items.isNotEmpty) {
          view.setStories(value.items
              .where((element) => element.categories.length != 0)
              .toList());
        } else {
          view.showError();
        }
      },
      onError: (error) {
        view.showError();
      },
    );
  }
}
