import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';

class GlowCheckbox extends StatelessWidget {
  const GlowCheckbox({
    Key? key,
    this.width,
    this.height,
    required this.value,
    this.enable = true,
    this.padding,
    this.margin,
    this.color,
    this.disableColor,
    this.glowColor,
    this.offset,
    this.spreadRadius,
    this.blurRadius,
    required this.onChange,
    this.checkColor,
    this.border,
    this.duration,
    this.curve,
    this.checkIcon,
  }) : super(key: key);

  final double? width;
  final double? height;
  final bool enable;
  final bool value;
  final Function(bool value)? onChange;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final BoxBorder? border;
  final Color? color;
  final Color? checkColor;
  final Color? disableColor;

  final IconData? checkIcon;

  //animation
  final Duration? duration;
  final Curve? curve;

  //glow properties
  final Color? glowColor;
  final Offset? offset;
  final double? spreadRadius;
  final double? blurRadius;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final checkBoxColor = _buildCheckboxColor(context);

    final glowTheme = GlowTheme.of(context);

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        if (onChange != null && enable) onChange?.call(!value);
      },
      child: GlowContainer(
        width: width ?? 24,
        height: height ?? 24,
        margin: margin ?? EdgeInsets.all(0),
        border: border ?? Border.all(width: 2, color: checkBoxColor),
        color: value ? checkBoxColor : checkBoxColor.withOpacity(0),
        glowColor: buildGlowColor(glowTheme, checkBoxColor),
        offset: offset ?? glowTheme?.offset ?? kDefaultGlowTheme.offset,
        blurRadius:
            blurRadius ?? glowTheme?.blurRadius ?? kDefaultGlowTheme.blurRadius,
        spreadRadius: spreadRadius ??
            glowTheme?.spreadRadius ??
            kDefaultGlowTheme.spreadRadius,
        shape: BoxShape.circle,
        animationDuration: duration ?? const Duration(milliseconds: 200),
        animationCurve: curve,
        child: value
            ? Icon(
                checkIcon ?? Icons.check,
                color: checkColor ?? theme.colorScheme.onPrimary,
                size: 18,
              )
            : SizedBox.shrink(),
      ),
    );
  }

  Color buildGlowColor(GlowThemeData? glowTheme, Color checkBoxColor) {
    return value && enable
        ? glowColor ?? glowTheme?.glowColor ?? checkBoxColor
        : Colors.transparent;
  }

  Color _buildCheckboxColor(BuildContext context) {
    return enable
        ? color ?? Theme.of(context).colorScheme.secondary
        : disableColor ?? Theme.of(context).disabledColor;
  }
}
