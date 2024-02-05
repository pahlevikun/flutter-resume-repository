import 'package:flutter/material.dart';
import 'package:pahlevikun.github.io/config/app_config.dart';
import 'package:pahlevikun.github.io/config/size_config.dart';
import 'package:pahlevikun.github.io/di/injector.dart';
import 'package:pahlevikun.github.io/domain/model/resume.dart';
import 'package:pahlevikun.github.io/domain/usecase/get_resume_data_usecase.dart';
import 'dart:js' as js;

import 'package:pahlevikun.github.io/presentation/base_page.dart';

class HeaderSection extends StatefulWidget {
  final Function hireMe;

  HeaderSection({
    GlobalKey? key,
    required this.hireMe,
  }) : super(key: key);

  @override
  State<HeaderSection> createState() => _HeaderSectionState();
}

class _HeaderSectionState extends State<HeaderSection> {
  final _useCase = Injector.locator<GetResumeDataUseCase>();

  late ResumeModel _data = _useCase.execute({});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constrain) {
        return BasePage(
          color: AppConfig.primaryColor,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: constrain.maxWidth / SizeConfig.SMALL_SIZE),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Flexible(
                  child: RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: _data.name,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: SizeConfig.HEADER_FONT_SIZE,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: SizeConfig.SMALL_LARGE_SIZE),
                Text(
                  _data.introduce,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w100,
                    fontSize: SizeConfig.SUB_HEADER_FONT_SIZE,
                  ),
                ),
                SizedBox(height: SizeConfig.LARGE_SIZE),
                Wrap(
                  runSpacing: SizeConfig.SMALL_SIZE,
                  spacing: SizeConfig.SMALL_SIZE,
                  crossAxisAlignment: WrapCrossAlignment.start,
                  children: <Widget>[
                    MaterialButton(
                      padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.LARGE_SMALL_SIZE,
                          vertical: SizeConfig.SMALL_SIZE),
                      onPressed: () {
                        widget.hireMe.call();
                      },
                      color: AppConfig.secondaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(
                            Icons.mail,
                            color: Colors.white,
                          ),
                          SizedBox(width: SizeConfig.SMALL_SIZE),
                          Text(
                            "Contact Me",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    MaterialButton(
                      padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.LARGE_SMALL_SIZE,
                          vertical: SizeConfig.SMALL_SIZE),
                      onPressed: () {
                        js.context.callMethod(
                            'open', ['/assets/files/CV_20201019.pdf']);
                      },
                      color: AppConfig.secondaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(
                            Icons.file_download,
                            color: Colors.white,
                          ),
                          SizedBox(width: SizeConfig.SMALL_SIZE),
                          Text(
                            "Download Resume",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
