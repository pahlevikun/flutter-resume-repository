import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:image_network/image_network.dart';
import 'package:pahlevikun.github.io/config/app_config.dart';
import 'package:pahlevikun.github.io/config/color_config.dart';
import 'package:pahlevikun.github.io/config/page_config.dart';
import 'package:pahlevikun.github.io/config/size_config.dart';
import 'package:pahlevikun.github.io/di/injector.dart';
import 'package:pahlevikun.github.io/domain/model/portofolio.dart';
import 'package:pahlevikun.github.io/domain/usecase/get_resume_data_usecase.dart';
import 'package:pahlevikun.github.io/presentation/base_page.dart';
import 'package:pahlevikun.github.io/presentation/widget/page_title.dart';

class PortfolioSection extends StatefulWidget {
  PortfolioSection(GlobalKey key) : super(key: key);

  @override
  _PortfolioSectionState createState() => _PortfolioSectionState();
}

class _PortfolioSectionState extends State<PortfolioSection> {
  final _useCase = Injector.locator<GetResumeDataUseCase>();
  late List<Portfolio> data = _useCase.execute({}).portfolio;

  Widget build(BuildContext context) {
    data.shuffle();
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
            child: PageTitle(PageConfig.portfolioTitle),
          ),
          const SizedBox(height: SizeConfig.LARGE_SIZE),
          _buildGitHub(),
          const SizedBox(height: SizeConfig.LARGE_SIZE),
          // _buildPorto(),
        ],
      ),
    );
  }

  Widget _buildGitHub() {
    return Padding(
      padding: const EdgeInsets.only(
        left: SizeConfig.HORIZONTAL_PADDING_SIZE,
        right: SizeConfig.HORIZONTAL_PADDING_SIZE,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(SizeConfig.MEDIUM_SIZE),
        child: Container(
          color: AppConfig.backgroundNestedCard.withAlpha(75),
          padding: const EdgeInsets.all(SizeConfig.MEDIUM_SIZE),
          child: ImageNetwork(
            image: "https://ghchart.rshah.org/98585c/pahlevikun",
            width: 650,
            height: 100,
            duration: 5000,
            curve: Curves.easeIn,
            onPointer: true,
            debugPrint: false,
            fullScreen: true,
            fitWeb: BoxFitWeb.scaleDown,
            onLoading: CircularProgressIndicator(
              color: AppConfig.secondaryColor,
            ),
            onTap: () => html.window.open(
              "https://github.com/pahlevikun",
              "github",
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPorto() {
    return Padding(
      padding: const EdgeInsets.only(
          left: SizeConfig.HORIZONTAL_PADDING_SIZE,
          right: SizeConfig.HORIZONTAL_PADDING_SIZE,
          bottom: SizeConfig.VERTICAL_PADDING_SIZE),
      child: StaggeredGridView.countBuilder(
        shrinkWrap: true,
        crossAxisCount: 8,
        itemCount: data.length,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) => new Container(
            padding: EdgeInsets.all(10.0),
            color: _getColor(index),
            child: Column(
              children: [
                Text(
                  _getType(index),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
                Text(
                  _getWorks(index),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w100,
                    fontSize: 13.0,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 15.0),
                  child: Text(
                    "- ${data[index].title} -",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 15.0),
                  child: Text(
                    data[index].description,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.0,
                    ),
                  ),
                )
              ],
            )),
        staggeredTileBuilder: (int index) => StaggeredTile.fit(2),
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
      ),
    );
  }

  // ignore: missing_return
  Color _getColor(int index) {
    switch (data[index].type) {
      case PortoType.ANDROID:
        return HexColor("#2274A5");
      case PortoType.IOS:
        return HexColor("#007DC5");
      case PortoType.FLUTTER:
        return HexColor("#0096B9");
      case PortoType.WEB_FRONT_END:
        return HexColor("#00B0BE");
      case PortoType.WEB_BACK_END:
        return HexColor("#009FCD");
    }
  }

  // ignore: missing_return
  String _getType(int index) {
    switch (data[index].type) {
      case PortoType.ANDROID:
        return "Android Native";
      case PortoType.IOS:
        return "iOS Native";
      case PortoType.FLUTTER:
        return "Flutter App";
      case PortoType.WEB_FRONT_END:
        return "Web Front-End";
      case PortoType.WEB_BACK_END:
        return "Web Back-End";
    }
  }

  // ignore: missing_return
  String _getWorks(int index) {
    switch (data[index].work) {
      case PortoWorks.PERSONAL_PROJECT:
        return "Personal Project";
      case PortoWorks.OFFICE_TASK:
        return "Office Task";
      case PortoWorks.OPEN_SOURCE:
        return "Open Source";
    }
  }
}
