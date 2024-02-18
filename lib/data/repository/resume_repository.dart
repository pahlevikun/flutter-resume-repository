import 'package:pahlevikun.github.io/data/source/local/local_gateway.dart';
import 'package:pahlevikun.github.io/domain/contract/resume_repository_contract.dart';
import 'package:pahlevikun.github.io/domain/model/resume.dart';

class ResumeRepositoryImpl implements ResumeRepository {
  final LocalGateway _localGateway;

  ResumeRepositoryImpl(
    this._localGateway,
  );

  @override
  ResumeModel getResumeModel() {
    return _localGateway.getData();
  }


}
