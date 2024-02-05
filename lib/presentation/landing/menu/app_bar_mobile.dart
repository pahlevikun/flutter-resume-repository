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
                backgroundImage: AssetImage(_useCase.execute({}).avatar),
                backgroundColor: Colors.white,
              ),
            ),
            SizedBox(width: SizeConfig.MEDIUM_SIZE),
            RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: _useCase.execute({}).name,
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
