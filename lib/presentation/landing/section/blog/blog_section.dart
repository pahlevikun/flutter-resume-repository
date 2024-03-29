import 'package:flutter/material.dart';
import 'package:pahlevikun.github.io/config/app_config.dart';
import 'package:pahlevikun.github.io/config/page_config.dart';
import 'package:pahlevikun.github.io/config/size_config.dart';
import 'package:pahlevikun.github.io/config/style_config.dart';
import 'package:pahlevikun.github.io/domain/model/story.dart';
import 'package:pahlevikun.github.io/presentation/view/react_button.dart';
import 'package:pahlevikun.github.io/presentation/widget/page_title.dart';
import 'package:pahlevikun.github.io/presentation/base_page.dart';
import 'package:pahlevikun.github.io/presentation/landing/section/blog/blog_contract.dart';
import 'package:pahlevikun.github.io/presentation/landing/section/blog/blog_presenter.dart';
import 'package:pahlevikun.github.io/presentation/landing/section/blog/model/blog_state.dart';
import 'package:pahlevikun.github.io/utils/datetime_utils.dart';
import 'package:url_launcher/url_launcher.dart';

class BlogSection extends StatefulWidget {
  BlogSection(GlobalKey key) : super(key: key);

  @override
  _BlogSectionState createState() => _BlogSectionState();
}

class _BlogSectionState extends State<BlogSection> implements BlogContract {
  late BlogPresenter presenter;
  List<Story> mediumStories = [];
  BlogState state = BlogState.LOADING;

  @override
  void initState() {
    super.initState();
    presenter = BlogPresenter(view: this);
    presenter.fetchData();
  }

  @override
  void showError() {
    setState(() {
      state = BlogState.ERROR;
    });
  }

  @override
  void showLoading() {
    setState(() {
      state = BlogState.LOADING;
    });
  }

  @override
  void setStories(List<Story> items) {
    setState(() {
      mediumStories = items;
      state = BlogState.SHOW_DATA;
    });
  }

  Widget build(BuildContext context) {
    return BasePage(
      child: _buildBody(),
    );
  }

  // ignore: missing_return
  Widget _buildBody() {
    switch (state) {
      case BlogState.LOADING:
        return Container();
      case BlogState.SHOW_DATA:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                left: SizeConfig.HORIZONTAL_PADDING_SIZE,
                right: SizeConfig.HORIZONTAL_PADDING_SIZE,
                top: SizeConfig.VERTICAL_PADDING_SIZE,
              ),
              child: PageTitle(PageConfig.blogTitle),
            ),
            const SizedBox(height: SizeConfig.LARGE_SIZE),
            _buildBlog(),
            const SizedBox(height: SizeConfig.LARGE_SIZE),
          ],
        );
      case BlogState.ERROR:
        return Container();
    }
  }

  Widget _buildBlog() {
    if (mediumStories.length == 0) {
      return Container();
    } else {
      return SingleChildScrollView(
        padding: EdgeInsets.only(left: SizeConfig.HORIZONTAL_PADDING_SIZE),
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: mediumStories
              .where((data) => data.categories.length != 0)
              .toList()
              .map((data) => _buildBlogItems(data))
              .toList(),
        ),
      );
    }
  }
}

Widget _buildBlogItems(Story story) {
  return Row(
    mainAxisSize: MainAxisSize.max,
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      ClipRRect(
        borderRadius: BorderRadius.circular(SizeConfig.MEDIUM_SIZE),
        child: Container(
          padding: EdgeInsets.all(SizeConfig.MEDIUM_SIZE),
          color: AppConfig.backgroundNestedCard.withAlpha(75),
          child: Container(
            width: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 164,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(SizeConfig.MEDIUM_SMALL_SIZE),
                    child: AspectRatio(
                      aspectRatio: 5 / 4,
                      child: Stack(
                        children: <Widget>[
                          ReactButton(
                            onTap: () => _openLink(story.link),
                            child: Container(
                              alignment: Alignment.center,
                              color: Colors.grey.withAlpha(24),
                              child: Image.network(
                                story.thumbnail,
                                fit: BoxFit.cover,
                                height: double.infinity,
                                width: double.infinity,
                              ),
                            ),
                          ),
                          Positioned(
                            top: SizeConfig.SMALL_SIZE,
                            left: SizeConfig.SMALL_SIZE,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                vertical: 2,
                                horizontal: SizeConfig.SMALL_LARGE_SIZE,
                              ),
                              decoration: BoxDecoration(
                                color: AppConfig.secondaryColor,
                                borderRadius: BorderRadius.circular(
                                  SizeConfig.LARGE_SIZE,
                                ),
                              ),
                              child: Text(
                                DateTimeUtils.dateTimeYear(story.pubDate),
                                style: StyleConfig.textStylePageInfoItem.copyWith(
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: SizeConfig.SMALL_LARGE_SIZE),
                Text(
                  story.title,
                  maxLines: 3,
                  textAlign: TextAlign.center,
                  style: StyleConfig.textStylePageInfoItem,
                )
              ],
            ),
          ),
        ),
      ),
      SizedBox(width: SizeConfig.LARGE_SIZE)
    ],
  );
}

_openLink(String link) {
  launch(link, forceSafariVC: true, enableJavaScript: true);
}
