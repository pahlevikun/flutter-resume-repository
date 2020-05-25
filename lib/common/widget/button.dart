import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pahlevikun.github.io/common/config/screen_util.dart';

class PositiveButton extends StatelessWidget {
  PositiveButton(
      {@required this.onPressed, this.title, this.width, this.margin}) {
    assert(title != null);
    assert(onPressed != null);
  }

  final GestureTapCallback onPressed;
  final String title;
  final double width;
  final EdgeInsetsGeometry margin;

  @override
  Widget build(BuildContext context) {
    final size = SizeConfig().init(context);
    final radius = 20.0;

    return Container(
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 1.0),
            blurRadius: 3.0,
          ),
        ],
      ),
      child: Material(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
            side: BorderSide(color: Colors.amber)),
        color: Colors.amber,
        child: InkWell(
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
          onTap: onPressed,
          splashColor: Colors.amber[300],
          child: Center(
              child: Container(
            margin: const EdgeInsets.only(
                left: 20.0, right: 20.0, top: 14.0, bottom: 14.0),
            child: Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          )),
        ),
      ),
    );
  }
}

class BackgroundButton extends StatelessWidget {
  BackgroundButton(
      {@required this.onPressed,
      this.title,
      this.width,
      this.margin,
      this.backgroundColor,
      this.textColor}) {
    assert(title != null);
    assert(textColor != null);
    assert(backgroundColor != null);
    assert(onPressed != null);
  }

  final GestureTapCallback onPressed;
  final String title;
  final double width;
  final EdgeInsetsGeometry margin;
  final Color backgroundColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    final size = SizeConfig().init(context);
    final radius = 20.0;

    return Container(
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 1.0),
            blurRadius: 3.0,
          ),
        ],
      ),
      child: Material(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
            side: BorderSide(color: backgroundColor)),
        color: backgroundColor,
        child: InkWell(
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
          onTap: onPressed,
          splashColor: Colors.grey[300],
          child: Center(
            child: Container(
              margin: const EdgeInsets.only(
                  left: 20.0, right: 20.0, top: 14.0, bottom: 14.0),
              child: Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class NegativeButton extends StatelessWidget {
  NegativeButton(
      {@required this.onPressed, this.title, this.width, this.margin}) {
    assert(title != null);
    assert(onPressed != null);
  }

  final GestureTapCallback onPressed;
  final String title;
  final double width;
  final EdgeInsetsGeometry margin;

  @override
  Widget build(BuildContext context) {
    final size = SizeConfig().init(context);
    final radius = 20.0;

    return Container(
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 1.0),
            blurRadius: 3.0,
          ),
        ],
      ),
      child: Material(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
            side: BorderSide(color: Colors.grey)),
        color: Colors.white,
        child: InkWell(
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
          onTap: onPressed,
          splashColor: Colors.grey[300],
          child: Center(
            child: Container(
              margin: const EdgeInsets.only(
                  left: 20.0, right: 20.0, top: 14.0, bottom: 14.0),
              child: Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class PositiveImageButton extends StatelessWidget {
  PositiveImageButton(
      {@required this.onPressed,
      this.title,
      this.width,
      this.margin,
      this.iconPath}) {
    assert(title != null);
    assert(iconPath != null);
    assert(onPressed != null);
  }

  final GestureTapCallback onPressed;
  final String title;
  final double width;
  final EdgeInsetsGeometry margin;
  final String iconPath;

  @override
  Widget build(BuildContext context) {
    final size = SizeConfig().init(context);
    final radius = 20.0;

    return Container(
        margin: margin,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 1.0),
              blurRadius: 3.0,
            ),
          ],
        ),
        child: Material(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius),
              side: BorderSide(color: Colors.amber)),
          color: Colors.amber,
          child: InkWell(
              customBorder: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius),
              ),
              onTap: onPressed,
              splashColor: Colors.amber[300],
              child: Stack(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(
                        left: 20.0, right: 20.0, top: 2.0, bottom: 2.0),
                    child: Image.asset(
                      iconPath,
                      width: size.getHorizontal(9),
                      height: size.getVertical(9),
                      fit: BoxFit.contain,
                    ),
                  ),
                  Positioned.fill(
                      child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ))
                ],
              )),
        ));
  }
}

class NegativeImageButton extends StatelessWidget {
  NegativeImageButton(
      {@required this.onPressed,
      this.title,
      this.width,
      this.margin,
      this.iconPath}) {
    assert(title != null);
    assert(iconPath != null);
    assert(onPressed != null);
  }

  final GestureTapCallback onPressed;
  final String title;
  final double width;
  final EdgeInsetsGeometry margin;
  final String iconPath;

  @override
  Widget build(BuildContext context) {
    final size = SizeConfig().init(context);
    final radius = 20.0;

    return Container(
        margin: margin,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 1.0),
              blurRadius: 3.0,
            ),
          ],
        ),
        child: Material(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius),
              side: BorderSide(color: Colors.grey[300])),
          color: Colors.white,
          child: InkWell(
              customBorder: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius),
              ),
              onTap: onPressed,
              splashColor: Colors.grey[300],
              child: Stack(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(
                        left: 20.0, right: 20.0, top: 2.0, bottom: 2.0),
                    child: Image.asset(
                      iconPath,
                      width: size.getHorizontal(9),
                      height: size.getVertical(9),
                      fit: BoxFit.contain,
                    ),
                  ),
                  Positioned.fill(
                      child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ))
                ],
              )),
        ));
  }
}
