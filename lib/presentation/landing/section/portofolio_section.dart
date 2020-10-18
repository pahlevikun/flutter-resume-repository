// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:flutter_advanced_networkimage/provider.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pahlevikun.github.io/common/config/screen_util.dart';
import 'package:pahlevikun.github.io/common/theme/theme.dart';
import 'package:pahlevikun.github.io/common/widget/hex_color.dart';
import 'package:pahlevikun.github.io/common/widget/page_title.dart';
import 'package:pahlevikun.github.io/data/resume/model/portofolio.dart';
import 'package:pahlevikun.github.io/data/resume/resume_data.dart';
import 'package:pahlevikun.github.io/presentation/base_page.dart';

class PortfolioSection extends StatefulWidget {
  PortfolioSection(GlobalKey key) : super(key: key);

  @override
  _PortfolioSectionState createState() => _PortfolioSectionState();
}

class _PortfolioSectionState extends State<PortfolioSection> {
  final data = ResumeData.getData().portos;

  Widget build(BuildContext context) {
    data.shuffle();
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
            child: PageTitle("Portfolio"),
          ),
          SizedBox(height: SizeConfig.LARGE_SIZE),
          _buildExpertise(),
          SizedBox(height: SizeConfig.LARGE_SIZE),
          _buildPorto()
        ],
      ),
    );
  }

  Widget _buildExpertise() {
    return Padding(
      padding: const EdgeInsets.only(
        left: SizeConfig.HORIZONTAL_PADDING_SIZE,
        right: SizeConfig.HORIZONTAL_PADDING_SIZE,
      ),
      child: InkWell(
        onTap: () =>
            html.window.open("https://github.com/pahlevikun", "github"),
        child: Image(
          width: double.infinity,
          fit: BoxFit.fill,
          image: AdvancedNetworkImage(
            "https://ghchart.rshah.org/2274A5/pahlevikun",
            useDiskCache: true,
            cacheRule: CacheRule(maxAge: const Duration(days: 10)),
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
                  style: PahleviThemePicker.getTheme()
                      .textTheme
                      .headline2
                      .copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0),
                ),
                Text(
                  _getWorks(index),
                  textAlign: TextAlign.center,
                  style: PahleviThemePicker.getTheme()
                      .textTheme
                      .bodyText2
                      .copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w100,
                          fontSize: 13.0),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 15.0),
                  child: Text(
                    "- ${data[index].title} -",
                    textAlign: TextAlign.center,
                    style: PahleviThemePicker.getTheme()
                        .textTheme
                        .bodyText2
                        .copyWith(
                            color: Colors.white,
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 15.0),
                  child: Text(
                    data[index].description,
                    style: PahleviThemePicker.getTheme()
                        .textTheme
                        .bodyText2
                        .copyWith(color: Colors.white, fontSize: 12.0),
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
