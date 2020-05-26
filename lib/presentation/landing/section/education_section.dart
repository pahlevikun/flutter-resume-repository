import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pahlevikun.github.io/common/config/screen_util.dart';
import 'package:pahlevikun.github.io/common/widget/page_title.dart';
import 'package:pahlevikun.github.io/presentation/base_page.dart';
import 'package:pahlevikun.github.io/presentation/landing/landing_page.dart';
import 'package:pahlevikun.github.io/data/resume/resume_data.dart';
import 'package:timeline_list/timeline.dart';
import 'package:timeline_list/timeline_model.dart';

class EducationSection extends StatefulWidget {
  EducationSection(GlobalKey key) : super(key: key);

  @override
  _EducationSectionState createState() => _EducationSectionState();
}

class _EducationSectionState extends State<EducationSection> {
  final _data = ResumeData.getData().education;

  @override
  Widget build(BuildContext context) {
    return BasePage(
      color: Colors.white,
      child: Padding(
        padding: SizeConfig.PAGE_CONTENT_PADDING,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            PageTitle("Education"),
            Timeline.builder(
              itemBuilder: timelineItemBuilder,
              itemCount: _data.length,
              position: TimelinePosition.Left,
              shrinkWrap: true,
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
              Text(
                data.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: SizeConfig.BODY_3_FONT_SIZE,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: SizeConfig.SMALL_SIZE),
                child: Text(
                  data.field,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: SizeConfig.BODY_1_FONT_SIZE,
                  ),
                ),
              ),
              Text(
                data.year,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: SizeConfig.BODY_1_FONT_SIZE,
                ),
              ),
              Text(
                data.institution,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: SizeConfig.BODY_1_FONT_SIZE,
                ),
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
                  color: SUB_COLOR,
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
        iconBackground: SUB_COLOR,
        icon: Icon(
          FontAwesomeIcons.book,
          color: Colors.white,
        ));
  }
}
