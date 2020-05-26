import 'package:flutter/material.dart';
import 'package:pahlevikun.github.io/common/config/app_config.dart';
import 'package:pahlevikun.github.io/common/config/screen_util.dart';

class AnimatedText extends StatefulWidget {
  final Function onTap;
  final int bounceDuration;
  final String text;
  final int maxLines;
  final TextAlign textAlign;
  final double textSize;

  AnimatedText(
      {this.onTap,
      this.text,
      this.bounceDuration = 200,
      this.maxLines = 3,
      this.textAlign = TextAlign.center,
      this.textSize = SizeConfig.BODY_3_FONT_SIZE});

  @override
  _AnimatedTextState createState() => _AnimatedTextState();
}

class _AnimatedTextState extends State<AnimatedText>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<Color> _colorTween;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: widget.bounceDuration),
    );
    _colorTween = ColorTween(
      begin: Colors.black87,
      end: AppConfig.secondaryColor,
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTapDown() {
    _controller.forward();
  }

  void _onTapUp() {
    _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, child) {
        return InkWell(
          highlightColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          splashColor: Colors.transparent,
          onHover: (value) {
            if (value)
              _onTapDown();
            else
              _onTapUp();
          },
          onTap: widget.onTap,
          child: Text(
            widget.text,
            maxLines: widget.maxLines,
            textAlign: widget.textAlign,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: _colorTween.value,
              fontWeight: FontWeight.bold,
              fontSize: widget.textSize,
            ),
          ),
        );
      },
    );
  }
}
