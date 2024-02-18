import 'package:flutter/material.dart';
import 'package:pahlevikun.github.io/config/app_config.dart';
import 'package:pahlevikun.github.io/config/page_config.dart';
import 'package:pahlevikun.github.io/config/size_config.dart';
import 'package:pahlevikun.github.io/config/style_config.dart';
import 'package:pahlevikun.github.io/di/injector.dart';
import 'package:pahlevikun.github.io/domain/model/resume.dart';
import 'package:pahlevikun.github.io/domain/model/volunteer.dart';
import 'package:pahlevikun.github.io/domain/usecase/get_resume_data_usecase.dart';
import 'package:pahlevikun.github.io/presentation/base_page.dart';
import 'package:pahlevikun.github.io/presentation/widget/page_title.dart';

class VolunteerSection extends StatefulWidget {
  VolunteerSection(GlobalKey key) : super(key: key);

  @override
  _VolunteerSectionState createState() => _VolunteerSectionState();
}

class _VolunteerSectionState extends State<VolunteerSection> {
  final _useCase = Injector.locator<GetResumeDataUseCase>();
  late ResumeModel _data = _useCase.execute({});

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
            child: PageTitle(PageConfig.volunteerTitle),
          ),
          const SizedBox(height: SizeConfig.LARGE_SIZE),
          _buildVolunteering(),
          const SizedBox(height: SizeConfig.LARGE_SIZE),
        ],
      ),
    );
  }

  Widget _buildVolunteer(Volunteer data) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(SizeConfig.MEDIUM_SIZE),
          child: Container(
            padding: EdgeInsets.all(SizeConfig.MEDIUM_SIZE),
            color: AppConfig.backgroundNestedCard.withAlpha(75),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: SizeConfig.ULTRA_SIZE,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(SizeConfig.MEDIUM_SIZE),
                    child: AspectRatio(
                      aspectRatio: 1 / 1,
                      child: Stack(
                        children: <Widget>[
                          Container(
                            alignment: Alignment.center,
                            color: Colors.grey.withAlpha(24),
                            child: SizedBox(
                              width: 95,
                              height: 95,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(SizeConfig.MEDIUM_SIZE),
                                child: AspectRatio(
                                  aspectRatio: 1 / 1,
                                  child: Image(
                                    image: AssetImage(data.imagePath),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: SizeConfig.SMALL_SIZE,
                            left: SizeConfig.TINY_SIZE,
                            right: SizeConfig.TINY_SIZE,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                vertical: SizeConfig.TINY_SIZE,
                                horizontal: SizeConfig.TINY_LARGE_SIZE,
                              ),
                              decoration: BoxDecoration(
                                color: AppConfig.secondaryColor,
                                borderRadius: BorderRadius.circular(
                                  SizeConfig.LARGE_SIZE,
                                ),
                              ),
                              child: Text(
                                data.duration,
                                textAlign: TextAlign.center,
                                style: StyleConfig.textStylePageInfoItem.copyWith(
                                  fontSize: 10.5,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: SizeConfig.SMALL_SIZE),
                Text(
                  data.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: StyleConfig.textStylePageInfoItem.copyWith(
                    fontSize: SizeConfig.BODY_3_FONT_SIZE,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  data.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: StyleConfig.textStylePageInfoItem,
                )
              ],
            ),
          ),
        ),
        SizedBox(width: SizeConfig.LARGE_SIZE)
      ],
    );
  }

  Widget _buildVolunteering() {
    return SingleChildScrollView(
      padding: EdgeInsets.only(left: SizeConfig.HORIZONTAL_PADDING_SIZE),
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: _data.volunteer.map((e) => _buildVolunteer(e)).toList(),
      ),
    );
  }
}
