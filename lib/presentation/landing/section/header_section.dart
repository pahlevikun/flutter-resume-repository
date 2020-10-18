import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pahlevikun.github.io/common/config/app_config.dart';
import 'package:pahlevikun.github.io/common/config/screen_util.dart';
import 'package:pahlevikun.github.io/data/resume/resume_data.dart';
import 'dart:js' as js;

import '../../base_page.dart';

class HeaderSection extends StatelessWidget {
  final Function hireMe;
  final _data = ResumeData.getData();

  HeaderSection({
    GlobalKey key,
    this.hireMe,
  }) : super(key: key);

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
                      onPressed: hireMe,
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
                      onPressed: (){
                        js.context.callMethod('open', ['/assets/files/CV_20201019.pdf']);
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
