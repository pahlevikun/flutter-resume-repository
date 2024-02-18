import 'package:flutter/material.dart';
import 'package:pahlevikun.github.io/config/app_config.dart';
import 'package:pahlevikun.github.io/config/size_config.dart';
import 'package:pahlevikun.github.io/config/style_config.dart';

class PageTitle extends StatelessWidget {
  final String title;

  PageTitle(this.title);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: StyleConfig.textStylePageTitle,
        ),
        SizedBox(height: SizeConfig.TINY_LARGE_SIZE),
        Container(
          width: 38,
          height: 4,
          decoration: BoxDecoration(
            color: AppConfig.secondaryColor,
            borderRadius: BorderRadius.circular(24),
          ),
        )
      ],
    );
  }
}
