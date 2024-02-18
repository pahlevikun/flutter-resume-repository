import 'package:flutter/material.dart';
import 'package:pahlevikun.github.io/config/app_config.dart';
import 'package:pahlevikun.github.io/config/size_config.dart';

class BasePage extends StatelessWidget {
  final Color? color;
  final Widget child;

  BasePage({
    required this.child,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color ?? AppConfig.backgroundCard,
      elevation: SizeConfig.TINY_LARGE_SIZE,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: SizedBox(
        width: double.infinity,
        child: child,
      ),
    );
  }
}
