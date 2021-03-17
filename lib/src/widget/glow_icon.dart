import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../flutter_glow.dart';

class GlowIcon extends Icon {
  const GlowIcon(
    this.icon, {
    Key? key,
    this.size,
    this.color,
    this.semanticLabel,
    this.textDirection,
    this.glowColor,
    this.offset,
    this.blurRadius,
  }) : super(icon, key: key);

  final IconData? icon;

  final double? size;

  final Color? color;

  final String? semanticLabel;

  final TextDirection? textDirection;

  //glow properties
  final Color? glowColor;
  final Offset? offset;
  final double? blurRadius;

  @override
  Widget build(BuildContext context) {
    assert(this.textDirection != null || debugCheckHasDirectionality(context));
    final TextDirection textDirection = this.textDirection ?? Directionality.of(context);

    final IconThemeData iconTheme = IconTheme.of(context);

    final double? iconSize = size ?? iconTheme.size;

    if (icon == null) {
      return Semantics(
        label: semanticLabel,
        child: SizedBox(width: iconSize, height: iconSize),
      );
    } else {
      final glowTheme = GlowTheme.of(context);

      final glowColorValue =
          glowColor ?? glowTheme?.glowColor ?? color ?? kDefaultGlowTheme.glowColor!;
      final glowOffset = offset ?? glowTheme?.offset ?? kDefaultGlowTheme.offset!;
      final double glowBlurRadius =
          blurRadius ?? glowTheme?.blurRadius ?? kDefaultGlowTheme.blurRadius!;

      final double? iconOpacity = iconTheme.opacity;
      Color? iconColor = color ?? iconTheme.color;
      if (iconOpacity != 1.0) iconColor = iconColor!.withOpacity(iconColor.opacity * iconOpacity!);

      Widget iconWidget = RichText(
        overflow: TextOverflow.visible, // Never clip.
        textDirection: textDirection, // Since we already fetched it for the assert...
        text: TextSpan(
          text: String.fromCharCode(icon!.codePoint),
          style: TextStyle(
            inherit: false,
            color: iconColor,
            fontSize: iconSize,
            fontFamily: icon!.fontFamily,
            shadows: [
              Shadow(
                color: glowColorValue,
                offset: glowOffset,
                blurRadius: glowBlurRadius * 2,
              )
            ],
            package: icon!.fontPackage,
          ),
        ),
      );

      if (icon!.matchTextDirection) {
        switch (textDirection) {
          case TextDirection.rtl:
            iconWidget = Transform(
              transform: Matrix4.identity()..scale(-1.0, 1.0, 1.0),
              alignment: Alignment.center,
              transformHitTests: false,
              child: iconWidget,
            );
            break;
          case TextDirection.ltr:
            break;
        }
      }

      return Semantics(
        label: semanticLabel,
        child: ExcludeSemantics(
          child: SizedBox(
            width: iconSize,
            height: iconSize,
            child: Center(
              child: iconWidget,
            ),
          ),
        ),
      );
    }
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IconDataProperty('icon', icon, ifNull: '<empty>', showName: false));
    properties.add(DoubleProperty('size', size, defaultValue: null));
    properties.add(ColorProperty('color', color, defaultValue: null));
  }
}
