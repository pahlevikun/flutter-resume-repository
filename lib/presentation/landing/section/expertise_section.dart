import 'package:flutter/material.dart';
import 'package:pahlevikun.github.io/common/config/screen_util.dart';
import 'package:pahlevikun.github.io/common/widget/page_title.dart';
import 'package:pahlevikun.github.io/data/resume/model/expertise.dart';
import 'package:pahlevikun.github.io/data/resume/resume_data.dart';
import 'package:pahlevikun.github.io/presentation/base_page.dart';

class ExpertiseSection extends StatefulWidget {
  ExpertiseSection(GlobalKey key) : super(key: key);

  @override
  _ExpertiseSectionState createState() => _ExpertiseSectionState();
}

class _ExpertiseSectionState extends State<ExpertiseSection> {
  Widget build(BuildContext context) {
    return BasePage(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              left: SizeConfig.HORIZONTAL_PADDING_SIZE,
              right: SizeConfig.HORIZONTAL_PADDING_SIZE,
              top: SizeConfig.VERTICAL_PADDING_SIZE,
            ),
            child: PageTitle("Expertise"),
          ),
          SizedBox(height: SizeConfig.LARGE_SIZE),
          _buildExpertise(),
          SizedBox(height: SizeConfig.LARGE_SIZE),
        ],
      ),
    );
  }

  Widget _buildExpertise() {
    return Padding(
      padding: const EdgeInsets.only(
        left: SizeConfig.HORIZONTAL_PADDING_SIZE,
        right: SizeConfig.HORIZONTAL_PADDING_SIZE,
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: ResumeData.getData()
              .expertise
              .map((data) => _buildExpertiseItem(data))
              .toList(),
        ),
      ),
    );
  }

  Widget _buildExpertiseItem(Expertise data) {
    return Container(
      width: SizeConfig.EXPERTISE_BOX_SIZE,
      padding: EdgeInsets.only(right: SizeConfig.MEDIUM_SIZE),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(SizeConfig.MEDIUM_SIZE),
        child: Container(
          padding: EdgeInsets.all(SizeConfig.MEDIUM_SIZE),
          color: Colors.grey.withAlpha(24),
          child: Column(
            children: <Widget>[
              Container(
                height: SizeConfig.BIG_SIZE,
                child: Padding(
                  padding: EdgeInsets.only(bottom: SizeConfig.SMALL_SIZE),
                  child: Text(
                    data.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: SizeConfig.SUB_TITLE_2_FONT_SIZE,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: SizeConfig.SMALL_SIZE),
                child: Text(data.body,
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: SizeConfig.BODY_1_FONT_SIZE,
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
