import 'package:flutter/material.dart';
import 'package:pahlevikun.github.io/config/size_config.dart';
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
            child: PageTitle("Activity & Volunteering"),
          ),
          SizedBox(height: SizeConfig.LARGE_SIZE),
          _buildCompanies(),
          SizedBox(height: SizeConfig.LARGE_SIZE),
        ],
      ),
    );
  }

  Widget _buildVolunteer(Volunteer data) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Column(
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
                          width: SizeConfig.BIG_ULTRA_SIZE,
                          height: SizeConfig.BIG_ULTRA_SIZE,
                          child: CircleAvatar(
                            backgroundImage: AssetImage(data.imagePath),
                            backgroundColor: Colors.white,
                          ),
                        ),
                      ),
                      Positioned(
                        top: SizeConfig.SMALL_SIZE,
                        left: SizeConfig.SMALL_SIZE,
                        right: SizeConfig.SMALL_SIZE,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 2,
                            horizontal: SizeConfig.SMALL_SIZE,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.redAccent,
                            borderRadius:
                                BorderRadius.circular(SizeConfig.LARGE_SIZE),
                          ),
                          child: Text(
                            data.duration,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: SizeConfig.SMALL_SIZE,
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
              style: TextStyle(
                  fontSize: SizeConfig.BODY_3_FONT_SIZE,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              data.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: SizeConfig.BODY_2_FONT_SIZE),
            )
          ],
        ),
        SizedBox(width: SizeConfig.LARGE_SIZE)
      ],
    );
  }

  Widget _buildCompanies() {
    return SingleChildScrollView(
      padding: EdgeInsets.only(left: SizeConfig.HORIZONTAL_PADDING_SIZE),
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: _data
            .volunteer
            .map((e) => _buildVolunteer(e))
            .toList(),
      ),
    );
  }
}
