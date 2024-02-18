import 'package:flutter/material.dart';
import 'package:pahlevikun.github.io/config/app_config.dart';
import 'package:pahlevikun.github.io/config/size_config.dart';
import 'package:pahlevikun.github.io/di/injector.dart';
import 'package:pahlevikun.github.io/domain/usecase/get_resume_data_usecase.dart';
import 'package:pahlevikun.github.io/presentation/base_page.dart';

class AppBarMobile extends StatelessWidget {
  final _useCase = Injector.locator<GetResumeDataUseCase>();

  @override
  Widget build(BuildContext context) {
    return BasePage(
      color: AppConfig.primaryColor,
      child: Padding(
        padding: EdgeInsets.all(SizeConfig.SMALL_SIZE),
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.menu,
                color: AppConfig.textColor,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
            SizedBox(width: SizeConfig.MEDIUM_SIZE),
            Container(
              width: SizeConfig.LARGE_SIZE,
              height: SizeConfig.LARGE_SIZE,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppConfig.secondaryColor,
                  width: SizeConfig.VERY_TINY_SIZE,
                ),
              ),
              child: CircleAvatar(
                backgroundImage: AssetImage(_useCase.execute({}).avatar),
                backgroundColor: AppConfig.textColor,
              ),
            ),
            SizedBox(width: SizeConfig.MEDIUM_SIZE),
            RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: _useCase.execute({}).name,
                    style: TextStyle(
                      color: AppConfig.textColor,
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
