import 'package:flutter/material.dart';

@immutable
class GlowThemeData {
  const GlowThemeData({
    this.glowColor,
    this.offset,
    this.spreadRadius,
    this.blurRadius,
  });

  factory GlowThemeData.fromBoxShadow({required BoxShadow boxShadow}) => GlowThemeData(
        glowColor: boxShadow.color,
        offset: boxShadow.offset,
        spreadRadius: boxShadow.spreadRadius,
        blurRadius: boxShadow.blurRadius,
      );

  final Color? glowColor;
  final Offset? offset;
  final double? spreadRadius;
  final double? blurRadius;

  GlowThemeData copyWith({
    Color? glowColor,
    Offset? offset,
    double? spreadRadius,
    double? blurRadius,
  }) =>
      GlowThemeData(
        glowColor: glowColor ?? glowColor,
        offset: offset ?? offset,
        spreadRadius: spreadRadius ?? spreadRadius,
        blurRadius: blurRadius ?? blurRadius,
      );

  GlowThemeData copyFrom({
    required GlowThemeData other,
  }) =>
      GlowThemeData(
        glowColor: other.glowColor ?? this.glowColor,
        offset: other.offset ?? this.offset,
        spreadRadius: other.spreadRadius ?? this.spreadRadius,
        blurRadius: other.blurRadius ?? this.blurRadius,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GlowThemeData &&
          runtimeType == other.runtimeType &&
          glowColor == other.glowColor &&
          offset == other.offset &&
          spreadRadius == other.spreadRadius &&
          blurRadius == other.blurRadius;

  @override
  int get hashCode =>
      glowColor.hashCode ^ offset.hashCode ^ spreadRadius.hashCode ^ blurRadius.hashCode;

  @override
  String toString() {
    return 'GlowThemeData{glowColor: $glowColor, offset: $offset, spreadRadius: $spreadRadius, blurRadius: $blurRadius}';
  }
}

GlowThemeData kDefaultGlowTheme = GlowThemeData(
  glowColor: Color(0x1e000000),
  offset: Offset(0, 2),
  blurRadius: 6.0,
  spreadRadius: 0.0,
);
