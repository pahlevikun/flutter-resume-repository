import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pahlevikun.github.io/config/app_config.dart';
import 'package:pahlevikun.github.io/config/page_config.dart';
import 'package:pahlevikun.github.io/config/size_config.dart';
import 'package:pahlevikun.github.io/config/style_config.dart';
import 'package:pahlevikun.github.io/di/injector.dart';
import 'package:pahlevikun.github.io/domain/model/education.dart';
import 'package:pahlevikun.github.io/domain/usecase/get_resume_data_usecase.dart';
import 'package:pahlevikun.github.io/presentation/widget/page_title.dart';
import 'package:pahlevikun.github.io/presentation/base_page.dart';
import 'package:pahlevikun.github.io/presentation/widget/timeline/timeline.dart';
import 'package:pahlevikun.github.io/presentation/widget/timeline/timeline_model.dart';

class EducationSection extends StatefulWidget {
  EducationSection(GlobalKey key) : super(key: key);

  @override
  _EducationSectionState createState() => _EducationSectionState();
}

class _EducationSectionState extends State<EducationSection> {
  final _useCase = Injector.locator<GetResumeDataUseCase>();
  late List<Education> _data = _useCase.execute({}).education;
  final double _imageSize = 100;

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
            PageTitle(PageConfig.educationTitle),
            const SizedBox(height: SizeConfig.LARGE_SIZE),
            Timeline.builder(
              itemBuilder: timelineItemBuilder,
              color: AppConfig.backgroundCard,
              itemCount: _data.length,
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
    final data = _data[position];
    return TimelineModel(
      ClipRRect(
        borderRadius: BorderRadius.circular(SizeConfig.MEDIUM_SIZE),
        child: Container(
          color: AppConfig.backgroundNestedCard.withAlpha(75),
          padding: const EdgeInsets.only(
            top: SizeConfig.MEDIUM_SIZE,
            left: SizeConfig.MEDIUM_SIZE,
            right: SizeConfig.MEDIUM_SIZE,
          ),
          child: _buildEducationDetail(data),
        ),
      ),
      position: TimelineItemPosition.left,
      isFirst: position == 0,
      isLast: position == _data.length,
      iconBackground: AppConfig.secondaryColor,
      icon: Icon(
        Icons.subject,
        color: AppConfig.textColor,
      ),
    );
  }

  Widget _buildEducationDetail(Education data) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: _imageSize,
              height: _imageSize,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(SizeConfig.SMALL_SIZE),
                color: AppConfig.textColor,
                border: Border.all(
                  color: AppConfig.secondaryColor,
                  width: SizeConfig.TINY_SIZE,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(SizeConfig.TINY_SIZE),
                child: AspectRatio(
                  aspectRatio: 1 / 1,
                  child: Image(
                    image: AssetImage(data.image),
                    fit: BoxFit.fill,
                  ),
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
                      style: StyleConfig.textStylePageBodyTitle.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: SizeConfig.SMALL_SIZE,
                      ),
                      child: Text(
                        data.field,
                        style: StyleConfig.textStylePageBodyTitle.copyWith(
                          fontSize: 15,
                        ),
                      ),
                    ),
                    Text(
                      data.institution,
                      style: StyleConfig.textStylePageBodyTitle.copyWith(
                        fontSize: 13,
                      ),
                    ),
                    Text(
                      data.year,
                      style: StyleConfig.textStylePageBodyTitle.copyWith(
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
              flex: 1,
            )
          ],
        ),
        Padding(
          padding: EdgeInsets.only(
            top: SizeConfig.MEDIUM_SIZE,
          ),
          child: Text(
            data.description,
            textAlign: TextAlign.start,
            style: StyleConfig.textStylePageBodyContent.copyWith(
              fontSize: 16,
            ),
          ),
        ),
        const SizedBox(
          height: SizeConfig.MEDIUM_SIZE,
        ),
      ],
    );
  }
}
