import 'package:injectable/injectable.dart';
import 'package:pahlevikun.github.io/domain/contract/medium_repository_contract.dart';
import 'package:pahlevikun.github.io/domain/contract/usecase.dart';
import 'package:pahlevikun.github.io/domain/model/medium.dart';
import 'package:rxdart_ext/rxdart_ext.dart';

@Singleton()
class GetMediumStoriesUseCase implements UseCase<void, Single<Medium>> {
  final MediumRepository _repository;

  GetMediumStoriesUseCase(this._repository);

  @override
  Single<Medium> execute(void param) {
    return _repository.getMediumFeeds();
  }
}
