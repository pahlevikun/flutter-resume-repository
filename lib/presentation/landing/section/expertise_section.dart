import 'package:flutter/material.dart';
import 'package:pahlevikun.github.io/config/app_config.dart';
import 'package:pahlevikun.github.io/config/page_config.dart';
import 'package:pahlevikun.github.io/config/size_config.dart';
import 'package:pahlevikun.github.io/config/style_config.dart';
import 'package:pahlevikun.github.io/di/injector.dart';
import 'package:pahlevikun.github.io/domain/model/expertise.dart';
import 'package:pahlevikun.github.io/domain/model/skill.dart';
import 'package:pahlevikun.github.io/domain/usecase/get_resume_data_usecase.dart';
import 'package:pahlevikun.github.io/presentation/base_page.dart';
import 'package:pahlevikun.github.io/presentation/widget/page_title.dart';
import 'package:pahlevikun.github.io/utils/datetime_utils.dart';

class ExpertiseSection extends StatefulWidget {
  ExpertiseSection(GlobalKey key) : super(key: key);

  @override
  _ExpertiseSectionState createState() => _ExpertiseSectionState();
}

class _ExpertiseSectionState extends State<ExpertiseSection> {
  final _useCase = Injector.locator<GetResumeDataUseCase>();
  late List<Expertise> _data = _useCase.execute({}).expertise;

  Widget build(BuildContext context) {
    return BasePage(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              left: SizeConfig.HORIZONTAL_PADDING_SIZE,
              right: SizeConfig.HORIZONTAL_PADDING_SIZE,
              top: SizeConfig.VERTICAL_PADDING_SIZE,
            ),
            child: PageTitle(PageConfig.expertiseTitle),
          ),
          const SizedBox(height: SizeConfig.LARGE_SIZE),
          _buildExpertise(),
          const SizedBox(height: SizeConfig.MEDIUM_SIZE),
        ],
      ),
    );
  }

  Widget _buildExpertise() {
    return Padding(
      padding: const EdgeInsets.only(
        left: SizeConfig.HORIZONTAL_PADDING_SIZE,
      ),
      child: LayoutBuilder(
        builder: (_, constrain) {
          final maxWidth = constrain.maxWidth;
          final widthForTablet = 620;
          final skillWidth = maxWidth > widthForTablet
              ? (maxWidth - SizeConfig.LARGE_SMALL_SIZE) / 2
              : maxWidth;
          return Wrap(
            runSpacing: SizeConfig.MEDIUM_SIZE,
            children: _data
                .map(
                  (data) => SizedBox(
                    width: skillWidth,
                    child: _buildExpertiseItem(data),
                  ),
                )
                .toList(),
          );
        },
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
          color: AppConfig.backgroundNestedCard.withAlpha(75),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: SizeConfig.BIG_SIZE,
                child: Padding(
                  padding: EdgeInsets.only(top: SizeConfig.SMALL_SIZE),
                  child: Text(
                    data.title,
                    textAlign: TextAlign.start,
                    style: StyleConfig.textStylePageBodyTitle.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: SizeConfig.SMALL_SIZE),
                child: Text(
                  data.body,
                  textAlign: TextAlign.start,
                  style: StyleConfig.textStylePageBodyContent.copyWith(
                    fontSize: SizeConfig.BODY_2_FONT_SIZE,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  bottom: SizeConfig.LARGE_SIZE,
                  top: SizeConfig.MEDIUM_EXTRA_LARGE_SIZE,
                ),
                child: Column(
                  children:
                      data.skills.map((it) => _buildSkillItem(it)).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSkillItem(Skill skill) {
    final yoE =
        DateTimeUtils.countAge(skill.yearOfStartingThisExperience.round());
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SizedBox(height: SizeConfig.MEDIUM_LARGE_SIZE),
        Flexible(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(
                skill.name,
                style: StyleConfig.textStylePageInfoItem,
              ),
              Text(
                int.parse(yoE) < 1 ? "<1 YoE" : "$yoE YoE",
                style: StyleConfig.textStylePageInfoItem,
              )
            ],
          ),
        ),
        SizedBox(height: SizeConfig.TINY_LARGE_SIZE),
        Stack(
          children: <Widget>[
            Container(
              height: SizeConfig.MEDIUM_LARGE_SIZE,
              decoration: BoxDecoration(
                color: AppConfig.secondaryColor.withOpacity(.4),
                borderRadius:
                    BorderRadius.circular(SizeConfig.SMALL_LARGE_SIZE),
              ),
            ),
            FractionallySizedBox(
              widthFactor: skill.percent / 100,
              child: Container(
                height: SizeConfig.MEDIUM_LARGE_SIZE,
                decoration: BoxDecoration(
                  color: AppConfig.secondaryColor,
                  borderRadius:
                      BorderRadius.circular(SizeConfig.SMALL_LARGE_SIZE),
                ),
              ),
            ),
            Positioned.fill(
              child: Center(
                child: Text(
                  "${skill.percent}% Self Proficiency",
                  style: StyleConfig.textStylePageInfoItem.copyWith(
                    fontSize: 9.5,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
