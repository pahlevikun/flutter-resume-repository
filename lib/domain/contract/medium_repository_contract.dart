

import 'package:pahlevikun.github.io/domain/model/medium.dart';
import 'package:rxdart_ext/rxdart_ext.dart';

abstract class MediumRepository {
  Single<Medium> getMediumFeeds();
}
