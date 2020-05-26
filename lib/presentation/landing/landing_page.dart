import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:pahlevikun.github.io/common/config/app_config.dart';
import 'package:pahlevikun.github.io/common/config/screen_util.dart';
import 'package:pahlevikun.github.io/presentation//landing/section/header_section.dart';
import 'package:pahlevikun.github.io/presentation/landing/menu/app_bar_mobile.dart';
import 'package:pahlevikun.github.io/presentation/landing/menu/navigation.dart';
import 'package:pahlevikun.github.io/presentation/landing/section/about_section.dart';
import 'package:pahlevikun.github.io/presentation/landing/section/awards_section.dart';
import 'package:pahlevikun.github.io/presentation/landing/section/blog/blog_section.dart';
import 'package:pahlevikun.github.io/presentation/landing/section/contact/contact_section.dart';
import 'package:pahlevikun.github.io/presentation/landing/section/education_section.dart';
import 'package:pahlevikun.github.io/presentation/landing/section/experience_section.dart';
import 'package:pahlevikun.github.io/presentation/landing/section/expertise_section.dart';
import 'package:pahlevikun.github.io/presentation/landing/section/portofolio_section.dart';
import 'package:pahlevikun.github.io/presentation/landing/section/skill_section.dart';
import 'package:pahlevikun.github.io/presentation/landing/section/volunteer_section.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final keys = [
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constrain) {
        return constrain.maxWidth >= AppConfig.MIN_TABLET_SIZE
            ? _buildTabletBody()
            : _buildPhoneBody();
      },
    );
  }

  void _hireMe() {
    scrollToIndex(keys.length - 1);
  }

  Widget _homePage() {
    return IntrinsicHeight(
      child: Stack(
        children: <Widget>[
          Opacity(
            child: Navigation((_) {}),
            opacity: 0,
          ),
          Positioned.fill(
            child: HeaderSection(
              key: keys[0],
              hireMe: _hireMe,
            ),
          )
        ],
      ),
    );
  }

  Widget _addPadding() => const SizedBox(height: SizeConfig.MEDIUM_SIZE);

  Widget _buildListDetail(bool forTablet) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: SizeConfig.LARGE_SIZE),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Visibility(visible: !forTablet, child: AppBarMobile()),
          _homePage(),
          _addPadding(),
          AboutSection(keys[1], _hireMe),
          _addPadding(),
          ExpertiseSection(keys[2]),
          _addPadding(),
          SkillSection(keys[3]),
          _addPadding(),
          ExperienceSection(keys[4]),
          _addPadding(),
          PortfolioSection(keys[5]),
          _addPadding(),
          EducationSection(keys[6]),
          _addPadding(),
          AwardsSection(keys[7]),
          _addPadding(),
          VolunteerSection(keys[8]),
          _addPadding(),
          BlogSection(keys[9]),
          _addPadding(),
          ContactSection(keys[10]),
        ],
      ),
    );
  }

  void scrollToIndex(int index) {
    Scrollable.ensureVisible(
      keys[index].currentContext,
      duration: Duration(milliseconds: 500),
    );
    if (_scaffoldKey.currentState.isDrawerOpen) {
      Navigator.of(context).pop();
    }
  }

  Widget _buildNavigation(bool forTablet) {
    return Padding(
      padding: EdgeInsets.only(top: forTablet ? SizeConfig.LARGE_SIZE : 0),
      child: Navigation((index) {
        scrollToIndex(index);
      }),
    );
  }

  Widget _buildTabletBody() {
    return Scaffold(
      key: _scaffoldKey,
      body: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildNavigation(true),
          SizedBox(width: 24),
          LimitedBox(
            maxWidth: 720,
            child: _buildListDetail(true),
          )
        ],
      ),
    );
  }

  Widget _buildPhoneBody() {
    return Scaffold(
      key: _scaffoldKey,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: _buildListDetail(false),
      ),
      drawer: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.transparent,
        ),
        child: Drawer(
          child: _buildNavigation(false),
        ),
      ),
    );
  }
}
