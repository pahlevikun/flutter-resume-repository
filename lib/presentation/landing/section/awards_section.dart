import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pahlevikun.github.io/config/app_config.dart';
import 'package:pahlevikun.github.io/config/page_config.dart';
import 'package:pahlevikun.github.io/config/size_config.dart';
import 'package:pahlevikun.github.io/config/style_config.dart';
import 'package:pahlevikun.github.io/di/injector.dart';
import 'package:pahlevikun.github.io/domain/usecase/get_resume_data_usecase.dart';
import 'package:pahlevikun.github.io/presentation/base_page.dart';
import 'package:pahlevikun.github.io/presentation/widget/page_title.dart';
import 'package:pahlevikun.github.io/presentation/widget/timeline/timeline.dart';
import 'package:pahlevikun.github.io/presentation/widget/timeline/timeline_model.dart';

class AwardsSection extends StatefulWidget {
  AwardsSection(GlobalKey key) : super(key: key);

  @override
  _AwardsSectionState createState() => _AwardsSectionState();
}

class _AwardsSectionState extends State<AwardsSection> {
  final _useCase = Injector.locator<GetResumeDataUseCase>();

  @override
  Widget build(BuildContext context) {
    return BasePage(
      child: Padding(
        padding: const EdgeInsets.only(
          top: SizeConfig.VERTICAL_PADDING_SIZE,
          left: SizeConfig.HORIZONTAL_PADDING_SIZE,
          right: SizeConfig.MEDIUM_EXTRA_LARGE_SIZE,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            PageTitle(PageConfig.awardTitle),
            const SizedBox(height: SizeConfig.LARGE_SIZE),
            Timeline.builder(
              itemBuilder: timelineItemBuilder,
              itemCount: _useCase.execute({}).award.length,
              position: TimelinePosition.Left,
              shrinkWrap: true,
            ),
            const SizedBox(
              height: SizeConfig.MEDIUM_SIZE,
            ),
          ],
        ),
      ),
    );
  }

  TimelineModel timelineItemBuilder(
    BuildContext context,
    int position,
  ) {
    final _data = _useCase.execute({}).award;
    final data = _data[position];
    return TimelineModel(
      Padding(
        padding: const EdgeInsets.only(
          left: SizeConfig.MEDIUM_SIZE,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(SizeConfig.MEDIUM_SIZE),
          child: Container(
            width: double.infinity,
            color: AppConfig.backgroundNestedCard.withAlpha(75),
            padding: const EdgeInsets.all(SizeConfig.MEDIUM_SIZE),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  data.title,
                  style: StyleConfig.textStylePageBodyTitle.copyWith(
                      fontWeight: FontWeight.bold
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: SizeConfig.SMALL_SIZE),
                  child: Text(
                    data.year,
                    style: StyleConfig.textStylePageBodyContent.copyWith(
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                Text(
                  data.institution,
                  style: StyleConfig.textStylePageBodyContent,
                ),
                Visibility(
                  visible: data.description.isNotEmpty,
                  child: const SizedBox(
                    height: SizeConfig.MEDIUM_SIZE,
                  ),
                ),
                Visibility(
                  visible: data.description.isNotEmpty,
                  child: Text(
                    data.description,
                    style: StyleConfig.textStylePageInfoItem,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      position: TimelineItemPosition.left,
      isFirst: position == 0,
      isLast: position == _data.length - 1,
      iconBackground: AppConfig.secondaryColor,
      icon: Icon(
        Icons.vignette,
        color: AppConfig.textColor,
      ),
    );
  }
}
