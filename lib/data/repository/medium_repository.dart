import 'package:pahlevikun.github.io/data/source/local/local_gateway.dart';
import 'package:pahlevikun.github.io/data/source/remote/remote_gateway.dart';
import 'package:pahlevikun.github.io/domain/contract/medium_repository_contract.dart';
import 'package:pahlevikun.github.io/domain/contract/resume_repository_contract.dart';
import 'package:pahlevikun.github.io/domain/model/feed.dart';
import 'package:pahlevikun.github.io/domain/model/medium.dart';
import 'package:pahlevikun.github.io/domain/model/resume.dart';
import 'package:pahlevikun.github.io/domain/model/story.dart';
import 'package:rxdart_ext/src/single/single.dart';

class MediumRepositoryImpl implements MediumRepository {
  final RemoteGateway _gateway;

  MediumRepositoryImpl(
    this._gateway,
  );

  @override
  Single<Medium> getMediumFeeds() {
    return _gateway.getMediumFeeds().map((event) {
      return Medium(
        status: event.status ?? "",
        feed: Feed(
          url: event.feed?.url ?? "",
          title: event.feed?.title ?? "",
          link: event.feed?.link ?? "",
          author: event.feed?.author ?? "",
          description: event.feed?.description ?? "",
          image: event.feed?.image ?? "",
        ),
        items: event.items?.map((e) {
          String image = e.thumbnail ?? "";
          if (image.isEmpty && e.content?.isNotEmpty == true) {
            RegExp regex = RegExp(r'<img[^>]+src="([^">]+)"');
            Match? match = regex.firstMatch(e.content ?? "");
            if (match != null) {
              image = match.group(1)!;
            }
          }
              return Story(
                title: e.title ?? "",
                pubDate: e.pubDate ?? "",
                link: e.link ?? "",
                guid: e.guid ?? "",
                author: e.author ?? "",
                thumbnail: image,
                description: e.description ?? "",
                categories: e.categories ?? [],
              );
            }).toList() ??
            [],
      );
    });
  }
}
