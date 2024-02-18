import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pahlevikun.github.io/config/app_config.dart';
import 'package:pahlevikun.github.io/config/page_config.dart';
import 'package:pahlevikun.github.io/config/size_config.dart';
import 'package:pahlevikun.github.io/config/style_config.dart';
import 'package:pahlevikun.github.io/di/injector.dart';
import 'package:pahlevikun.github.io/domain/model/experience.dart';
import 'package:pahlevikun.github.io/domain/usecase/get_resume_data_usecase.dart';
import 'package:pahlevikun.github.io/presentation/base_page.dart';
import 'package:pahlevikun.github.io/presentation/widget/page_title.dart';
import 'package:pahlevikun.github.io/presentation/widget/timeline/timeline.dart';
import 'package:pahlevikun.github.io/presentation/widget/timeline/timeline_model.dart';
import 'package:collection/collection.dart';

class ExperienceSection extends StatefulWidget {
  ExperienceSection(GlobalKey key) : super(key: key);

  @override
  _ExperienceSectionState createState() => _ExperienceSectionState();
}

class _ExperienceSectionState extends State<ExperienceSection> {
  final double _imageSize = 100;
  final double _mobileImageSize = 70;
  final _useCase = Injector.locator<GetResumeDataUseCase>();
  late List<Experience> _data = _useCase.execute({}).experience;

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
            PageTitle(PageConfig.experienceTitle),
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
      _buildCompanyDetail(data),
      position: TimelineItemPosition.left,
      isFirst: position == 0,
      isLast: position == _data.length,
      iconBackground: AppConfig.secondaryColor,
      icon: Icon(
        FontAwesomeIcons.briefcase,
        color: AppConfig.textColor,
      ),
    );
  }

  Widget _buildCompanyDetail(Experience data) {
    return LayoutBuilder(
      builder: (context, constrain) {
        return constrain.maxWidth <= AppConfig.MAX_MOBILE_SIZE
            ? _buildCompanyDetailMobile(data)
            : _buildCompanyDetailTabletAndWeb(data);
      },
    );
  }

  ClipRRect _buildCompanyDetailMobile(Experience data) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(SizeConfig.MEDIUM_SIZE),
      child: Container(
        color: AppConfig.backgroundNestedCard.withAlpha(70),
        padding: const EdgeInsets.only(
          top: SizeConfig.MEDIUM_SIZE,
          bottom: SizeConfig.SMALL_SIZE,
          left: SizeConfig.MEDIUM_SIZE,
          right: SizeConfig.MEDIUM_SIZE,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: _mobileImageSize,
              height: _mobileImageSize,
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
            const SizedBox(
              height: SizeConfig.SMALL_SIZE,
              width: double.infinity,
            ),
            Text(
              data.title,
              style: StyleConfig.textStylePageBodyTitle.copyWith(
                fontWeight: FontWeight.bold,
                fontSize:
                data.duration.isNotEmpty == true ? 15 : 17,
              ),
            ),
            if (data.company != null)
              Text(
                data.company!,
                style: StyleConfig.textStylePageBodyTitle.copyWith(
                  fontSize: 14,
                ),
              ),
            Padding(
              padding: EdgeInsets.only(
                top: data.company == null
                    ? SizeConfig.MEDIUM_SIZE
                    : SizeConfig.TINY_SIZE,
              ),
              child: Text(
                data.employmentStatus,
                style: StyleConfig.textStylePageBodyTitle.copyWith(
                  fontSize:
                  data.nested?.isNotEmpty == true ? 13 : 12,
                ),
              ),
            ),
            Text(
              data.duration,
              style: StyleConfig.textStylePageBodyTitle.copyWith(
                fontSize: data.nested?.isNotEmpty == true ? 13 : 12,
              ),
            ),
            const SizedBox(
              height: SizeConfig.MEDIUM_SIZE,
            ),
            if (data.nested?.isNotEmpty == true)
              Column(
                children: data.nested
                        ?.mapIndexed(
                          (index, element) => Container(
                            padding: EdgeInsets.only(
                              top: SizeConfig.MEDIUM_SIZE,
                              bottom: SizeConfig.SMALL_SIZE,
                            ),
                            child: _buildCompanyDetailMobile(element),
                          ),
                        )
                        .toList() ??
                    [],
              ),
          ],
        ),
      ),
    );
  }

  ClipRRect _buildCompanyDetailTabletAndWeb(Experience data) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(SizeConfig.MEDIUM_SIZE),
      child: Container(
        color: AppConfig.backgroundNestedCard.withAlpha(70),
        padding: const EdgeInsets.only(
          top: SizeConfig.MEDIUM_SIZE,
          bottom: SizeConfig.SMALL_SIZE,
          left: SizeConfig.MEDIUM_SIZE,
          right: SizeConfig.MEDIUM_SIZE,
        ),
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
                            fontSize:
                                data.duration.isNotEmpty == true ? 18 : 21,
                          ),
                        ),
                        if (data.company != null)
                          Text(
                            data.company!,
                            style: StyleConfig.textStylePageBodyTitle.copyWith(
                              fontSize: 16,
                            ),
                          ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: data.company == null
                                ? SizeConfig.MEDIUM_SIZE
                                : SizeConfig.TINY_SIZE,
                          ),
                          child: Text(
                            data.employmentStatus,
                            style: StyleConfig.textStylePageBodyTitle.copyWith(
                              fontSize:
                                  data.nested?.isNotEmpty == true ? 15 : 14,
                            ),
                          ),
                        ),
                        Text(
                          data.duration,
                          style: StyleConfig.textStylePageBodyTitle.copyWith(
                            fontSize: data.nested?.isNotEmpty == true ? 15 : 14,
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
                  fontSize: 15,
                ),
              ),
            ),
            const SizedBox(
              height: SizeConfig.MEDIUM_SIZE,
            ),
            if (data.responsibility?.isNotEmpty == true)
              _buildResponsibility(data.responsibility!),
            if (data.workResult?.isNotEmpty == true)
              _buildWorkOn(data.workResult!),
            if (data.nested?.isNotEmpty == true)
              Column(
                children: data.nested
                        ?.mapIndexed(
                          (index, element) => Container(
                            padding: EdgeInsets.only(
                              left: SizeConfig.LARGE_SIZE,
                              right: SizeConfig.LARGE_SIZE,
                              top: SizeConfig.MEDIUM_SIZE,
                              bottom: SizeConfig.SMALL_SIZE,
                            ),
                            child: _buildCompanyDetailTabletAndWeb(element),
                          ),
                        )
                        .toList() ??
                    [],
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildResponsibility(List<String> responsibility) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: SizeConfig.SMALL_SIZE,
        ),
        Text(
          "Responsibility",
          style: StyleConfig.textStylePageBodyTitle.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
        const SizedBox(
          height: SizeConfig.MEDIUM_SIZE,
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(SizeConfig.MEDIUM_SIZE),
          child: Container(
            color: AppConfig.backgroundNestedCard.withAlpha(85),
            padding: const EdgeInsets.all(SizeConfig.MEDIUM_SIZE),
            child: ListView.builder(
              itemCount: responsibility.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "•\t\t",
                      style: StyleConfig.textStylePageBodyContent.copyWith(
                        fontSize: 14,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        responsibility[index],
                        textAlign: TextAlign.start,
                        style: StyleConfig.textStylePageBodyContent.copyWith(
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
        const SizedBox(
          height: SizeConfig.MEDIUM_SIZE,
        ),
      ],
    );
  }

  Widget _buildWorkOn(List<String> workOn) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: SizeConfig.SMALL_SIZE,
        ),
        Text(
          "Working History",
          style: StyleConfig.textStylePageBodyTitle.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
        const SizedBox(
          height: SizeConfig.MEDIUM_SIZE,
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(SizeConfig.MEDIUM_SIZE),
          child: Container(
            color: AppConfig.backgroundNestedCard.withAlpha(85),
            padding: const EdgeInsets.all(SizeConfig.MEDIUM_SIZE),
            child: ListView.builder(
              itemCount: workOn.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "•\t\t",
                      style: StyleConfig.textStylePageBodyContent.copyWith(
                        fontSize: 14,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        workOn[index],
                        textAlign: TextAlign.start,
                        style: StyleConfig.textStylePageBodyContent.copyWith(
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                );
              },
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
