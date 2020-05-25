import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'theme.dart';

class _PahleviTheme extends InheritedWidget {
  final PahleviThemeState data;

  _PahleviTheme({
    this.data,
    Key key,
    @required Widget child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(_PahleviTheme oldWidget) {
    return true;
  }
}

class PahleviTheme extends StatefulWidget {
  final Widget child;
  final PahleviThemeOption initialThemeKey;

  const PahleviTheme({
    Key key,
    this.initialThemeKey,
    @required this.child,
  }) : super(key: key);

  @override
  PahleviThemeState createState() => PahleviThemeState();

  static ThemeData of(BuildContext context) {
    _PahleviTheme inherited =
        (context.inheritFromWidgetOfExactType(_PahleviTheme) as _PahleviTheme);
    return inherited.data.theme;
  }

  static PahleviThemeState instanceOf(BuildContext context) {
    _PahleviTheme inherited =
        (context.inheritFromWidgetOfExactType(_PahleviTheme) as _PahleviTheme);
    return inherited.data;
  }
}

class PahleviThemeState extends State<PahleviTheme> {
  ThemeData _theme;

  ThemeData get theme => _theme;

  @override
  void initState() {
    _theme = PahleviThemePicker.getTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _PahleviTheme(
      data: this,
      child: widget.child,
    );
  }
}
