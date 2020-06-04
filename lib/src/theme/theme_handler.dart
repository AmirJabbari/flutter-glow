import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'theme.dart';
import 'glow_theme_type.dart';

export 'theme.dart';
export 'glow_theme_type.dart';


class GlowThemeHandler {
  GlowThemeHandler({
    @required this.theme,
    this.darkTheme,
    this.themeType = GlowThemeType.system,
  });

  final GlowThemeData theme;
  final GlowThemeData darkTheme;
  final GlowThemeType themeType;

  bool get useDark =>
      darkTheme != null &&
      ( //forced to use DARK by user
          themeType == GlowThemeType.dark ||
              //The setting indicating the current brightness mode of the host platform.
              // If the platform has no preference, platformBrightness defaults to Brightness.light.
              window.platformBrightness == Brightness.dark);

  GlowThemeData get current {
    if (useDark) {
      return darkTheme;
    } else {
      return theme;
    }
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GlowThemeHandler &&
          runtimeType == other.runtimeType &&
          theme == other.theme &&
          darkTheme == other.darkTheme &&
          themeType == other.themeType;

  @override
  int get hashCode => theme.hashCode ^ darkTheme.hashCode ^ themeType.hashCode;

  GlowThemeHandler copyWith({
    GlowThemeData theme,
    GlowThemeData darkTheme,
    GlowThemeType themeType,
  }) =>
      GlowThemeHandler(
        theme: theme ?? this.theme,
        darkTheme: darkTheme ?? this.darkTheme,
        themeType: themeType ?? this.themeType,
      );
}
