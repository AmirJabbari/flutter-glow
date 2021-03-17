import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';

class GlowRadio<T> extends StatelessWidget {
  GlowRadio({
    required this.value,
    required this.groupValue,
    required this.onChange,
    this.color,
    this.glowColor,
    this.width,
    this.height,
    this.enable = true,
    this.padding,
    this.margin,
    this.border,
    this.checkColor,
    this.disableColor,
    this.duration,
    this.curve,
    this.offset,
    this.spreadRadius,
    this.blurRadius,
    this.checkIcon,
  });

  final T value;
  final T groupValue;
  final ValueChanged<T> onChange;
  final Color? color;

  final IconData? checkIcon;

  final double? width;
  final double? height;
  final bool enable;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final BoxBorder? border;
  final Color? checkColor;
  final Color? disableColor;

  //animation
  final Duration? duration;
  final Curve? curve;

  //glow properties
  final Color? glowColor;
  final Offset? offset;
  final double? spreadRadius;
  final double? blurRadius;

  bool get checked => value == groupValue;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    final checkBoxColor = _buildCheckboxColor(context);

    final glowTheme = GlowTheme.of(context);

    return GestureDetector(
      onTap: () {
        if (onChange != null && enable) onChange(value);
      },
      child: GlowContainer(
        width: width ?? 24,
        height: height ?? 24,
        margin: margin ?? EdgeInsets.all(0),
        border: border ?? Border.all(width: 2, color: checkBoxColor),
        color: checked ? checkBoxColor : checkBoxColor.withOpacity(0),
        glowColor: buildGlowColor(glowTheme, checkBoxColor),
        offset: offset ?? glowTheme?.offset ?? kDefaultGlowTheme.offset,
        blurRadius: blurRadius ?? glowTheme?.blurRadius ?? kDefaultGlowTheme.blurRadius,
        spreadRadius: spreadRadius ?? glowTheme?.spreadRadius ?? kDefaultGlowTheme.spreadRadius,
        shape: BoxShape.circle,
        animationDuration: duration ?? const Duration(milliseconds: 200),
        animationCurve: curve,
        child: checked
            ? Icon(checkIcon ?? Icons.radio_button_checked,
                color: checkColor ?? theme.colorScheme.onPrimary, size: 18)
            : SizedBox.shrink(),
      ),
    );
  }

  Color buildGlowColor(GlowThemeData? glowTheme, Color checkBoxColor) {
    return checked && (enable ?? true)
        ? glowColor ?? glowTheme?.glowColor ?? checkBoxColor ?? kDefaultGlowTheme.glowColor!
        : Colors.transparent;
  }

  Color _buildCheckboxColor(BuildContext context) {
    return enable ?? true
        ? color ?? Theme.of(context).toggleableActiveColor
        : disableColor ?? Theme.of(context).disabledColor;
  }
}
