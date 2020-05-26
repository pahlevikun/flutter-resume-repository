import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pahlevikun.github.io/common/config/screen_util.dart';
import 'package:pahlevikun.github.io/common/widget/page_title.dart';
import 'package:pahlevikun.github.io/presentation/base_page.dart';
import 'package:pahlevikun.github.io/data/resume/resume_data.dart';
import 'package:pahlevikun.github.io/data/resume/model/skill.dart';

import '../landing_page.dart';

class SkillSection extends StatefulWidget {
  SkillSection(GlobalKey key) : super(key: key);

  @override
  _SkillSectionState createState() => _SkillSectionState();
}

class _SkillSectionState extends State<SkillSection> {
  @override
  Widget build(BuildContext context) {
    return BasePage(
      color: Colors.white,
      child: Padding(
        padding: SizeConfig.PAGE_CONTENT_PADDING,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            PageTitle("Skills"),
            SizedBox(height: SizeConfig.LARGE_SIZE),
            Text(
              ResumeData.getData().introSkill,
              style: TextStyle(
                fontSize: SizeConfig.BODY_2_FONT_SIZE,
                color: Colors.grey,
              ),
            ),
            _buildSkill(
                "Industry Knowledge", ResumeData.getData().industrySkill),
            _buildSkill(
                "Technical Knowledge", ResumeData.getData().technicalSkill)
          ],
        ),
      ),
    );
  }

  Widget _buildSkill(String title, List<Skill> items) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: SizeConfig.LARGE_SIZE),
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: SizeConfig.BODY_3_FONT_SIZE,
          ),
        ),
        SizedBox(height: SizeConfig.MEDIUM_SIZE),
        LayoutBuilder(
          builder: (_, constrain) {
            final maxWidth = constrain.maxWidth;
            final widthForTablet = 500;
            final skillWidth = maxWidth > widthForTablet
                ? (maxWidth - SizeConfig.LARGE_SMALL_SIZE) / 2
                : maxWidth;
            return Wrap(
              spacing: SizeConfig.LARGE_SMALL_SIZE,
              runSpacing: SizeConfig.LARGE_SMALL_SIZE,
              children: items
                  .map(
                    (it) => SizedBox(
                      width: skillWidth,
                      child: _buildSkillItem(it),
                    ),
                  )
                  .toList(),
            );
          },
        )
      ],
    );
  }

  Widget _buildSkillItem(Skill skill) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text(
              skill.name,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: SizeConfig.BODY_2_FONT_SIZE),
            ),
            Text(
              "${skill.percent}%",
              style: TextStyle(fontSize: SizeConfig.BODY_2_FONT_SIZE),
            )
          ],
        ),
        SizedBox(height: 8),
        Stack(
          children: <Widget>[
            Container(
              height: 3,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(.5),
                borderRadius: BorderRadius.circular(SizeConfig.SMALL_SIZE),
              ),
            ),
            FractionallySizedBox(
              widthFactor: skill.percent / 100,
              child: Container(
                height: 3,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(SizeConfig.SMALL_SIZE),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
