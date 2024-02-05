import 'package:pahlevikun.github.io/data/source/local/local_gateway.dart';
import 'package:pahlevikun.github.io/data/source/remote/remote_gateway.dart';
import 'package:pahlevikun.github.io/domain/contract/medium_repository_contract.dart';
import 'package:pahlevikun.github.io/domain/contract/resume_repository_contract.dart';
import 'package:pahlevikun.github.io/domain/model/medium.dart';
import 'package:pahlevikun.github.io/domain/model/resume.dart';
import 'package:rxdart_ext/src/single/single.dart';

class MediumRepositoryImpl implements MediumRepository {
  final RemoteGateway _gateway;

  MediumRepositoryImpl(
    this._gateway,
  );

  @override
  Single<Medium> getMediumFeeds() {
    // TODO: implement getMediumFeeds
    throw UnimplementedError();
  }

}
