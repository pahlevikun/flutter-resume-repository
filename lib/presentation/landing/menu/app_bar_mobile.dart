import 'package:flutter/material.dart';
import 'package:pahlevikun.github.io/common/config/screen_util.dart';
import 'package:pahlevikun.github.io/presentation/base_page.dart';
import 'package:pahlevikun.github.io/presentation/landing/landing_page.dart';
import 'package:pahlevikun.github.io/presentation/resume/resume_data.dart';

class AppBarMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BasePage(
      color: MAIN_COLOR,
      child: Padding(
        padding: EdgeInsets.all(SizeConfig.SMALL_SIZE),
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.white,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
            SizedBox(width: SizeConfig.MEDIUM_SIZE),
            SizedBox(
              width: SizeConfig.LARGE_SIZE,
              height: SizeConfig.LARGE_SIZE,
              child: CircleAvatar(
                backgroundImage: AssetImage(ResumeData.getData().avatar),
                backgroundColor: Colors.white,
              ),
            ),
            SizedBox(width: SizeConfig.MEDIUM_SIZE),
            RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: ResumeData.getData().name,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: SizeConfig.MEDIUM_EXTRA_LARGE_SIZE,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
    ;
  }
}
