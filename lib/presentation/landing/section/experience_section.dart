import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pahlevikun.github.io/common/config/app_config.dart';
import 'package:pahlevikun.github.io/common/config/screen_util.dart';
import 'package:pahlevikun.github.io/common/widget/page_title.dart';
import 'package:pahlevikun.github.io/common/widget/responsive_widget.dart';
import 'package:pahlevikun.github.io/data/resume/resume_data.dart';
import 'package:pahlevikun.github.io/presentation/base_page.dart';
import 'package:timeline_list/timeline.dart';
import 'package:timeline_list/timeline_model.dart';

class ExperienceSection extends StatefulWidget {
  ExperienceSection(GlobalKey key) : super(key: key);

  @override
  _ExperienceSectionState createState() => _ExperienceSectionState();
}

class _ExperienceSectionState extends State<ExperienceSection> {
  final double _imageSize = 80;
  final _data = ResumeData.getData().experience;

  @override
  Widget build(BuildContext context) {
    return BasePage(
      color: Colors.white,
      child: Padding(
        padding: SizeConfig.PAGE_CONTENT_PADDING,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            PageTitle("Experience"),
            ResponsiveWidget(
              largeScreen: Timeline.builder(
                itemBuilder: timelineItemBuilder,
                itemCount: ResumeData.getData().experience.length,
                position: TimelinePosition.Left,
                shrinkWrap: true,
              ),
              mediumScreen: Timeline.builder(
                itemBuilder: timelineItemBuilder,
                itemCount: ResumeData.getData().experience.length,
                position: TimelinePosition.Center,
                shrinkWrap: true,
              ),
              smallScreen: Timeline.builder(
                itemBuilder: timelineItemBuilder,
                itemCount: ResumeData.getData().experience.length,
                position: TimelinePosition.Left,
                shrinkWrap: true,
              ),
            )
          ],
        ),
      ),
    );
  }

  TimelineModel timelineItemBuilder(BuildContext context, int position) {
    final data = _data[position];
    return TimelineModel(
        Padding(
          padding: const EdgeInsets.only(
              top: SizeConfig.LARGE_SIZE,
              left: SizeConfig.MEDIUM_SIZE,
              right: SizeConfig.MEDIUM_SIZE),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: _imageSize,
                    child: AspectRatio(
                      aspectRatio: 1 / 1,
                      child: Image(
                        image: AssetImage(data.image),
                        fit: BoxFit.fill, // use this
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: SizeConfig.MEDIUM_SIZE),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            data.title,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: SizeConfig.BODY_3_FONT_SIZE,
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.only(top: SizeConfig.SMALL_SIZE),
                            child: Text(
                              data.duration,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: SizeConfig.BODY_1_FONT_SIZE,
                              ),
                            ),
                          ),
                          Text(
                            data.company,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: SizeConfig.BODY_1_FONT_SIZE,
                            ),
                          ),
                        ],
                      ),
                    ),
                    flex: 1,
                  )
                ],
              ),
              const SizedBox(
                height: SizeConfig.LARGE_SIZE,
              ),
              Text(
                data.description,
                textAlign: TextAlign.justify,
              ),
              const SizedBox(
                height: SizeConfig.SMALL_SIZE,
              ),
              Padding(
                padding: const EdgeInsets.only(top: SizeConfig.LARGE_SIZE),
                child: Divider(
                  color: AppConfig.secondaryColor,
                ),
              )
            ],
          ),
        ),
        position: position % 2 == 0
            ? TimelineItemPosition.left
            : TimelineItemPosition.right,
        isFirst: position == 0,
        isLast: position == _data.length,
        iconBackground: AppConfig.secondaryColor,
        icon: Icon(
          FontAwesomeIcons.briefcase,
          color: Colors.white,
        ));
  }
}
