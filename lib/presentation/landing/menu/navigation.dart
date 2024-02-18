import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pahlevikun.github.io/config/app_config.dart';
import 'package:pahlevikun.github.io/config/size_config.dart';
import 'package:pahlevikun.github.io/config/style_config.dart';
import 'package:pahlevikun.github.io/di/injector.dart';
import 'package:pahlevikun.github.io/domain/usecase/get_resume_data_usecase.dart';
import 'package:pahlevikun.github.io/presentation/view/menu_button.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Navigation extends StatelessWidget {
  final Function onTap;
  final _useCase = Injector.locator<GetResumeDataUseCase>();

  Navigation({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return _buildNavigation();
  }

  Widget _buildNavigationOption({
    required String title,
    required IconData icon,
    required Function onTap,
  }) {
    return MenuButton(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(
          top: SizeConfig.TINY_LARGE_SIZE,
          bottom: SizeConfig.TINY_LARGE_SIZE,
        ),
        child: Row(
          children: <Widget>[
            Icon(
              icon,
              color: AppConfig.textColor,
              size: SizeConfig.MEDIUM_LARGE_SIZE,
            ),
            SizedBox(width: SizeConfig.SMALL_LARGE_SIZE),
            Text(
              title,
              style: StyleConfig.textStyleCta,
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
          launchUrlString(url);
        },
        elevation: 2,
        backgroundColor: AppConfig.secondaryColor,
        child: Icon(
          iconData,
          color: AppConfig.textColor,
          size: SizeConfig.MEDIUM_SIZE,
        ),
      ),
    );
  }

  Widget _buildNavigation() {
    return Card(
      color: AppConfig.primaryColor,
      elevation: SizeConfig.SMALL_LARGE_SIZE,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(SizeConfig.SMALL_LARGE_SIZE),
      ),
      child: Padding(
        padding: EdgeInsets.all(SizeConfig.LARGE_SIZE),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppConfig.secondaryColor,
                    width: SizeConfig.TINY_LARGE_SIZE,
                  ),
                ),
                child: CircleAvatar(
                  backgroundImage: AssetImage(_useCase.execute({}).avatar),
                  backgroundColor: AppConfig.textColor,
                ),
              ),
              SizedBox(height: SizeConfig.LARGE_SMALL_SIZE),
              RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: _useCase.execute({}).name,
                      style: TextStyle(
                        color: AppConfig.textColor,
                        fontWeight: FontWeight.bold,
                        fontSize: SizeConfig.LARGE_SMALL_SIZE,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: SizeConfig.TINY_SIZE),
              Text(
                _useCase.execute({}).job,
                style: TextStyle(
                  color: AppConfig.textColor,
                  fontWeight: FontWeight.w200,
                  fontSize: SizeConfig.MEDIUM_SMALL_SIZE,
                ),
              ),
              SizedBox(height: SizeConfig.LARGE_MEDIUM_SIZE),
              _buildNavigationOption(
                title: "Home",
                icon: Icons.home,
                onTap: () {
                  this.onTap(0);
                },
              ),
              _buildNavigationOption(
                title: "About",
                icon: Icons.account_box,
                onTap: () {
                  this.onTap(1);
                },
              ),
              _buildNavigationOption(
                title: "Blog",
                icon: Icons.style,
                onTap: () {
                  this.onTap(2);
                },
              ),
              _buildNavigationOption(
                title: "Expertise",
                icon: FontAwesomeIcons.key,
                onTap: () {
                  this.onTap(3);
                },
              ),
              _buildNavigationOption(
                title: "Experience",
                icon: Icons.work,
                onTap: () {
                  this.onTap(4);
                },
              ),
              _buildNavigationOption(
                title: "Education",
                icon: Icons.subject,
                onTap: () {
                  this.onTap(5);
                },
              ),
              _buildNavigationOption(
                title: "Activity & Volunteering",
                icon: FontAwesomeIcons.football,
                onTap: () {
                  this.onTap(6);
                },
              ),
              _buildNavigationOption(
                title: "Portfolio",
                icon: Icons.extension,
                onTap: () {
                  this.onTap(7);
                },
              ),
              _buildNavigationOption(
                title: "Award, Certificate & Honor",
                icon: Icons.vignette,
                onTap: () {
                  this.onTap(8);
                },
              ),
              _buildNavigationOption(
                title: "Contact",
                icon: Icons.contacts,
                onTap: () {
                  this.onTap(9);
                },
              ),
              SizedBox(height: SizeConfig.LARGE_MEDIUM_SIZE),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  _buildLinkingButton(
                    FontAwesomeIcons.facebookF,
                    _useCase.execute({}).facebook,
                  ),
                  _buildLinkingButton(
                    FontAwesomeIcons.instagram,
                    _useCase.execute({}).instagram,
                  ),
                  _buildLinkingButton(
                    FontAwesomeIcons.githubAlt,
                    _useCase.execute({}).github,
                  ),
                  _buildLinkingButton(
                    FontAwesomeIcons.linkedinIn,
                    _useCase.execute({}).linkedin,
                  ),
                  _buildLinkingButton(
                    FontAwesomeIcons.twitter,
                    _useCase.execute({}).twitter,
                  ),
                ],
              ),
              SizedBox(height: SizeConfig.LARGE_SIZE),
              Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  _useCase.execute({}).email,
                  style: TextStyle(
                    color: AppConfig.textColor.withOpacity(.5),
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
