import 'package:flutter/material.dart';
import 'package:pahlevikun.github.io/common/config/app_config.dart';

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
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        SizedBox(height: 12),
        Container(
          width: 32,
          height: 4,
          decoration: BoxDecoration(
            color: AppConfig.secondaryColor,
            borderRadius: BorderRadius.circular(16),
          ),
        )
      ],
    );
  }
}
