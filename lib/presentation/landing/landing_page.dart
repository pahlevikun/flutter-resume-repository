import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:pahlevikun.github.io/config/app_config.dart';
import 'package:pahlevikun.github.io/config/size_config.dart';
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
import 'package:pahlevikun.github.io/presentation/landing/section/volunteer_section.dart';
import 'package:pahlevikun.github.io/presentation/view/hideable_glow_behavior.dart';

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
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constrain) {
        return constrain.maxWidth >= AppConfig.MIN_TABLET_SIZE
            ? _buildWebBrowserBody()
            : _buildTabletAndPhoneBody(
                isPhone: constrain.maxWidth <= 500,
              );
      },
    );
  }

  void _hireMe() {
    scrollToIndex(9);
  }

  Widget _homePage() {
    return IntrinsicHeight(
      child: Stack(
        children: <Widget>[
          Opacity(
            child: Navigation(onTap: (_) {}),
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

  Widget _buildListDetail(bool forTablet, bool isSmartPhone) {
    return ScrollConfiguration(
      behavior: HideableGlowBehavior().copyWith(scrollbars: false),
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: SizeConfig.LARGE_SIZE),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Visibility(
              visible: !forTablet,
              child: AppBarMobile(),
            ),
            _homePage(),
            _addPadding(),
            AboutSection(keys[1], _hireMe),
            _addPadding(),
            BlogSection(keys[2]),
            _addPadding(),
            ExpertiseSection(keys[3]),
            _addPadding(),
            ExperienceSection(keys[4]),
            _addPadding(),
            EducationSection(keys[5]),
            _addPadding(),
            VolunteerSection(keys[6]),
            _addPadding(),
            if (!isSmartPhone) PortfolioSection(keys[7]),
            if (!isSmartPhone) _addPadding(),
            if (!isSmartPhone) AwardsSection(keys[8]),
            if (!isSmartPhone) _addPadding(),
            ContactSection(keys[9])
          ],
        ),
      ),
    );
  }

  void scrollToIndex(int index) {
    Scrollable.ensureVisible(
      keys[index].currentContext!,
      duration: Duration(milliseconds: 500),
    );
    if (_scaffoldKey.currentState?.isDrawerOpen == true) {
      Navigator.of(context).pop();
    }
  }

  Widget _buildNavigation(bool forTablet, bool isPhone) {
    return Padding(
      padding: EdgeInsets.only(top: forTablet ? SizeConfig.LARGE_SIZE : 0),
      child: Navigation(
        isPhone: isPhone,
        onTap: (index) {
          scrollToIndex(index);
        },
      ),
    );
  }

  Widget _buildWebBrowserBody() {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppConfig.backgroundColor,
      body: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildNavigation(true, false),
          SizedBox(width: 24),
          LimitedBox(
            maxWidth: 800,
            child: _buildListDetail(true, false),
          )
        ],
      ),
    );
  }

  Widget _buildTabletAndPhoneBody({required bool isPhone}) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppConfig.backgroundColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: _buildListDetail(false, isPhone),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppConfig.secondaryColor,
        tooltip: 'Back to Top',
        onPressed: () {
          scrollToIndex(0);
        },
        child: Icon(
          Icons.arrow_upward_rounded,
          color: AppConfig.textColor,
          size: SizeConfig.LARGE_SIZE,
        ),
      ),
      drawer: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.transparent,
        ),
        child: Drawer(
          child: _buildNavigation(false, isPhone),
        ),
      ),
    );
  }
}
