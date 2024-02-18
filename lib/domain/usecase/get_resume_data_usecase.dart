import 'package:injectable/injectable.dart';
import 'package:pahlevikun.github.io/domain/contract/resume_repository_contract.dart';
import 'package:pahlevikun.github.io/domain/contract/usecase.dart';
import 'package:pahlevikun.github.io/domain/model/resume.dart';

@Singleton()
class GetResumeDataUseCase extends UseCase<void, ResumeModel> {
  final ResumeRepository _repository;

  GetResumeDataUseCase(this._repository);

  @override
  ResumeModel execute(void param) {
    return _repository.getResumeModel();
  }
}
