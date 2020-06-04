import 'package:flutter/material.dart';
import 'theme.dart';
import 'theme_handler.dart';
import 'glow_theme_type.dart';

class GlowThemeInherited extends InheritedWidget {
  const GlowThemeInherited({
    Key key,
    @required Widget child,
    @required this.value,
    @required this.onChange,
  })  : assert(child != null),
        super(key: key, child: child);

  final GlowThemeHandler value;

  final ValueChanged<GlowThemeHandler> onChange;

  @override
  bool updateShouldNotify(GlowThemeInherited oldWidget) => value != oldWidget.value;

  GlowThemeData get current => value.current;

  bool get isUsingDark => value.useDark;

  GlowThemeType get themeType => value.themeType;

  set themeType(GlowThemeType themeType) => onChange(value.copyWith(themeType: themeType));

  set updateCurrentTheme(GlowThemeData themeData) => onChange(
        value.copyWith(
          theme: isUsingDark ? null : themeData,
          darkTheme: isUsingDark ? themeData : null,
        ),
      );
}
