import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pahlevikun.github.io/common/config/screen_util.dart';
import 'package:pahlevikun.github.io/common/widget/menu_button.dart';
import 'package:pahlevikun.github.io/presentation/landing/landing_page.dart';
import 'package:pahlevikun.github.io/data/resume/resume_data.dart';
import 'package:url_launcher/url_launcher.dart';

class Navigation extends StatelessWidget {
  final Function onTap;

  Navigation(this.onTap);

  @override
  Widget build(BuildContext context) {
    return _buildNavigation();
  }

  Widget _buildNavigationOption(
    String title,
    IconData icon, {
    Function onTap,
  }) {
    return MenuButton(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(
            top: SizeConfig.TINY_LARGE_SIZE,
            bottom: SizeConfig.TINY_LARGE_SIZE),
        child: Row(
          children: <Widget>[
            Icon(
              icon,
              color: Colors.white,
              size: SizeConfig.MEDIUM_LARGE_SIZE,
            ),
            SizedBox(width: SizeConfig.SMALL_LARGE_SIZE),
            Text(
              title,
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildLinkingButton(IconData iconData, String url) {
    return Container(
      width: SizeConfig.LARGE_SIZE,
      height: SizeConfig.LARGE_SIZE,
      margin: EdgeInsets.only(right: SizeConfig.SMALL_LARGE_SIZE),
      child: FloatingActionButton(
        onPressed: () {
          launch(url);
        },
        elevation: 2,
        backgroundColor: SUB_COLOR,
        child: Icon(
          iconData,
          color: Colors.white,
          size: SizeConfig.MEDIUM_SIZE,
        ),
      ),
    );
  }

  Widget _buildNavigation() {
    return Card(
      color: MAIN_COLOR,
      elevation: SizeConfig.SMALL_LARGE_SIZE,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(SizeConfig.SMALL_LARGE_SIZE)),
      child: Padding(
        padding: EdgeInsets.all(SizeConfig.LARGE_SIZE),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(
                width: 96,
                height: 96,
                child: CircleAvatar(
                  backgroundImage: AssetImage(ResumeData.getData().avatar),
                  backgroundColor: Colors.white,
                ),
              ),
              SizedBox(height: SizeConfig.LARGE_SMALL_SIZE),
              RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: ResumeData.getData().name,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: SizeConfig.LARGE_SMALL_SIZE,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: SizeConfig.TINY_SIZE),
              Text(
                ResumeData.getData().job,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w200,
                  fontSize: SizeConfig.MEDIUM_SMALL_SIZE,
                ),
              ),
              SizedBox(height: SizeConfig.LARGE_MEDIUM_SIZE),
              _buildNavigationOption("Home", Icons.home, onTap: () {
                this.onTap(0);
              }),
              _buildNavigationOption("About", Icons.account_box, onTap: () {
                this.onTap(1);
              }),
              _buildNavigationOption("Expertise", FontAwesomeIcons.key,
                  onTap: () {
                this.onTap(2);
              }),
              _buildNavigationOption("Skills", Icons.book, onTap: () {
                this.onTap(3);
              }),
              _buildNavigationOption("Experience", Icons.work, onTap: () {
                this.onTap(4);
              }),
              _buildNavigationOption("Portfolio", Icons.extension, onTap: () {
                this.onTap(5);
              }),
              _buildNavigationOption("Education", Icons.subject, onTap: () {
                this.onTap(6);
              }),
              _buildNavigationOption("Certificate", Icons.vignette, onTap: () {
                this.onTap(7);
              }),
              _buildNavigationOption(
                  "Activity & Volunteering", FontAwesomeIcons.footballBall,
                  onTap: () {
                this.onTap(8);
              }),
              _buildNavigationOption("Blog", Icons.style, onTap: () {
                this.onTap(9);
              }),
              _buildNavigationOption("Contact", Icons.contacts, onTap: () {
                this.onTap(10);
              }),
              SizedBox(height: SizeConfig.LARGE_MEDIUM_SIZE),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  _buildLinkingButton(
                    FontAwesomeIcons.facebookF,
                    ResumeData.getData().facebook,
                  ),
                  _buildLinkingButton(
                    FontAwesomeIcons.instagram,
                    ResumeData.getData().instagram,
                  ),
                  _buildLinkingButton(
                    FontAwesomeIcons.githubAlt,
                    ResumeData.getData().github,
                  ),
                  _buildLinkingButton(
                    FontAwesomeIcons.linkedinIn,
                    ResumeData.getData().linkedin,
                  ),
                  _buildLinkingButton(
                    FontAwesomeIcons.twitter,
                    ResumeData.getData().twitter,
                  ),
                ],
              ),
              SizedBox(height: SizeConfig.LARGE_SIZE),
              Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  ResumeData.getData().email,
                  style: TextStyle(
                    color: Colors.white.withOpacity(.5),
                    fontWeight: FontWeight.w100,
                    fontStyle: FontStyle.italic,
                    fontSize: SizeConfig.SMALL_LARGE_SIZE,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
