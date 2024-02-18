import 'package:injectable/injectable.dart';
import 'package:pahlevikun.github.io/data/source/local/data/resume_data.dart';
import 'package:pahlevikun.github.io/data/source/local/local_gateway.dart';

@module
abstract class StorageModule {
  @Singleton()
  ResumeData provideResumeData() => ResumeData();

  @Singleton()
  LocalGateway provideLocalGateway(ResumeData data) {
    return LocalGateway(data);
  }
}
