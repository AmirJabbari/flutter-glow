import 'package:flutter/material.dart';
import 'package:flutterglow/src/theme/ingerited_glow_theme.dart';
import 'package:flutterglow/src/theme/theme.dart';
import 'package:flutterglow/src/theme/theme_handler.dart';
import 'package:flutterglow/src/theme/glow_theme_type.dart';

class GlowTheme extends StatefulWidget {
  const GlowTheme({
    Key key,
    @required this.child,
    this.lightTheme,
    this.darkTheme,
    this.themeType,
  }) : super(key: key);

  final Widget child;
  final GlowThemeData lightTheme;
  final GlowThemeData darkTheme;
  final GlowThemeType themeType;

  @override
  _GlowThemeState createState() => _GlowThemeState();
}

class _GlowThemeState extends State<GlowTheme> {
  GlowThemeHandler _themeHandler;

  @override
  void initState() {
    super.initState();
    _themeHandler = GlowThemeHandler(
      theme: widget.lightTheme,
      darkTheme: widget.darkTheme,
      themeType: widget.themeType,
    );
  }

  @override
  void didUpdateWidget(GlowTheme oldWidget) {
    super.didUpdateWidget(oldWidget);
    _themeHandler = GlowThemeHandler(
      theme: widget.lightTheme,
      darkTheme: widget.darkTheme,
      themeType: widget.themeType,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GlowThemeInherited(
      value: _themeHandler,
      onChange: (value) {
        setState(() {
          _themeHandler = value;
        });
      },
      child: widget.child,
    );
  }
}
