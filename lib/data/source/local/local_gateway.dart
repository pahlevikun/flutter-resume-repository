import 'package:pahlevikun.github.io/data/source/local/data/resume_data.dart';
import 'package:pahlevikun.github.io/domain/model/resume.dart';

class LocalGateway {
  final ResumeData _resumeData;

  LocalGateway(
    this._resumeData,
  );

  ResumeModel getData() => _resumeData.getData();
}
