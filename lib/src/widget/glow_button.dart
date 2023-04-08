import 'package:flutter/material.dart';
import 'package:flutter_glow/src/widget/glow_container.dart';
import '../theme/glow_theme.dart';

class GlowButton extends StatelessWidget {
  const GlowButton({
    Key? key,
    required this.child,
    this.width,
    this.height,
    this.padding,
    this.color,
    this.disableColor,
    this.glowColor,
    this.splashColor,
    this.borderRadius,
    this.border,
    this.offset,
    this.spreadRadius,
    this.blurRadius,
    required this.onPressed,
  }) : super(key: key);

  final double? width, height;
  final EdgeInsetsGeometry? padding;
  final Color? color;
  final Color? disableColor;
  final Color? splashColor;
  final Widget child;
  final BorderRadiusGeometry? borderRadius;
  final BoxBorder? border;
  final VoidCallback? onPressed;

  //glow properties
  final Color? glowColor;
  final Offset? offset;
  final double? spreadRadius;
  final double? blurRadius;

  bool get enable => onPressed != null;

  bool get disable => !enable;

  @override
  Widget build(BuildContext context) {
    final buttonTheme = Theme.of(context).buttonTheme;

    final theme = Theme.of(context);

    final buttonColor = _buildButtonColor(context);

    final glowTheme = GlowTheme.of(context);
    return GlowContainer(
      height: height ?? buttonTheme.height,
      width: width ?? buttonTheme.minWidth,
      color: buttonColor,
      borderRadius: borderRadius ?? BorderRadius.circular(4),
      glowColor: glowColor ?? glowTheme?.glowColor ?? buttonColor,
      offset: offset ?? glowTheme?.offset ?? kDefaultGlowTheme.offset,
      blurRadius: blurRadius ?? glowTheme?.blurRadius ?? kDefaultGlowTheme.blurRadius,
      spreadRadius: spreadRadius ?? glowTheme?.spreadRadius ?? kDefaultGlowTheme.spreadRadius,
      border: border,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: borderRadius as BorderRadius? ?? BorderRadius.circular(4),
          splashColor: splashColor ?? theme.splashColor,
          onTap: onPressed,
          child: Container(
            alignment: Alignment.center,
            padding: padding ?? buttonTheme.padding,
            child: DefaultTextStyle(
              style: Theme.of(context).textTheme.button!,
              child: child,
            ),
          ),
        ),
      ),
    );
  }

  Color _buildButtonColor(BuildContext context) {
    return enable
        ? color ?? Theme.of(context).buttonTheme.colorScheme!.primary
        : disableColor ?? Theme.of(context).buttonTheme.colorScheme!.primary.withOpacity(0.4);
  }
}
