import 'package:flutter/material.dart';

import '../../flutter_glow.dart';

class GlowContainer extends StatelessWidget {
  const GlowContainer({
    Key key,
    this.height,
    this.width,
    this.padding,
    this.margin,
    this.color,
    this.alignment,
    this.borderRadius,
    this.border,
    this.shape,
    this.glowColor,
    this.offset,
    this.spreadRadius,
    this.blurRadius,
    this.animationDuration,
    this.animationCurve,
    this.child,
  }) : super(key: key);

  final double height;
  final double width;
  final Color color;
  final BorderRadiusGeometry borderRadius;
  final AlignmentGeometry alignment;
  final BoxBorder border;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final BoxShape shape;
  final Widget child;

  //animation
  final Duration animationDuration;
  final Curve animationCurve;

  //glow properties
  final Color glowColor;
  final Offset offset;
  final double spreadRadius;
  final double blurRadius;

  @override
  Widget build(BuildContext context) {
    final glowTheme = GlowTheme.of(context);
    return AnimatedContainer(
      height: height,
      width: width,
      padding: padding,
      margin: margin,
      alignment: alignment,
      duration: animationDuration ?? const Duration(milliseconds: 300),
      curve: animationCurve,
      decoration: BoxDecoration(
        color: color,
        borderRadius: borderRadius,
        boxShadow: [
          BoxShadow(
            color: glowColor ?? glowTheme?.glowColor ?? kDefaultGlowTheme.glowColor,
            offset: offset ?? glowTheme?.offset ?? kDefaultGlowTheme.offset,
            blurRadius: blurRadius ?? glowTheme?.blurRadius ?? kDefaultGlowTheme.blurRadius,
            spreadRadius: spreadRadius ?? glowTheme?.spreadRadius ?? kDefaultGlowTheme.spreadRadius,
          ),
        ],
        border: border,
        shape: shape ?? BoxShape.rectangle,
      ),
      child: child,
    );
  }
}
