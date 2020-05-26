import 'package:flutter/material.dart';
import 'package:pahlevikun.github.io/common/config/screen_util.dart';
import 'package:pahlevikun.github.io/common/widget/page_title.dart';
import 'package:pahlevikun.github.io/presentation/base_page.dart';
import 'package:pahlevikun.github.io/data/resume/resume_data.dart';

class AboutSection extends StatelessWidget {
  final Function hireMe;

  final double _avatarSize = 108;

  AboutSection(GlobalKey key, this.hireMe) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BasePage(
      child: Padding(
        padding: SizeConfig.PAGE_CONTENT_PADDING,
        child: LayoutBuilder(
          builder: (_, constrain) {
            final maxWidth = constrain.maxWidth;
            final isTabletSize = _isTabletSize(maxWidth);

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                PageTitle("About me"),
                SizedBox(height: SizeConfig.LARGE_SIZE),
                _multiChildLayout(
                  forTablet: isTabletSize,
                  children: <Widget>[
                    SizedBox(width: SizeConfig.MEDIUM_SIZE),
                    SizedBox(
                      width: _avatarSize,
                      height: _avatarSize,
                      child: CircleAvatar(
                        backgroundImage:
                            NetworkImage(ResumeData.getData().avatar),
                        backgroundColor: Colors.white,
                      ),
                    ),
                    SizedBox(
                        width: SizeConfig.LARGE_SIZE,
                        height: SizeConfig.LARGE_SIZE),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Hello, I'm Farhan",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: SizeConfig.SUB_TITLE_1_FONT_SIZE,
                            ),
                          ),
                          SizedBox(height: SizeConfig.LARGE_SMALL_SIZE),
                          Text(
                            ResumeData.getData().about,
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              fontSize: SizeConfig.BODY_2_FONT_SIZE,
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(height: SizeConfig.LARGE_SMALL_SIZE),
                          LayoutBuilder(
                            builder: (_, constrain) => Wrap(
                              direction: Axis.horizontal,
                              children: ResumeData.getData()
                                  .aboutInfo
                                  .entries
                                  .toList()
                                  .map((pair) => SizedBox(
                                      width: isTabletSize
                                          ? constrain.maxWidth / 2
                                          : constrain.maxWidth,
                                      child:
                                          _buildInfoItem(pair.key, pair.value)))
                                  .toList(),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _multiChildLayout({
    bool forTablet,
    List<Widget> children,
  }) {
    Widget result;
    if (!forTablet) {
      result = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: children,
      );
    } else {
      result = Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      );
    }
    return result;
  }

  bool _isTabletSize(double maxWidth) {
    return maxWidth > 4 * _avatarSize;
  }

  Widget _buildInfoItem(String field, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: RichText(
        text: TextSpan(children: [
          TextSpan(
            text: "$field: ",
            style: TextStyle(
                color: Colors.grey, fontSize: SizeConfig.BODY_2_FONT_SIZE),
          ),
          TextSpan(
            text: value,
            style: TextStyle(
                color: Colors.black87, fontSize: SizeConfig.BODY_2_FONT_SIZE),
          ),
        ]),
      ),
    );
  }
}
