
import 'package:injectable/injectable.dart';
import 'package:pahlevikun.github.io/config/build_config.dart';

@module
abstract class ApplicationModules {
  @Singleton()
  @Named("build_mode")
  bool provideBuildMode() => BuildConfig.BUILD_LOG_ENABLED_MODE;

}
