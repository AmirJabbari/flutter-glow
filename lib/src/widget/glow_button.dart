import 'package:flutter/material.dart';
import '../theme/glow_theme.dart';
import '../theme/theme.dart';

class GlowButton extends StatelessWidget {
  final double width, height;
  final EdgeInsetsGeometry padding;
  final Color color;
  final Color disableColor;
  final bool isDisable;
  final Widget child;
  final BorderRadiusGeometry borderRadius;
  final BoxBorder border;
  final VoidCallback onPressed;

  //glow properties
  final Color glowColor;
  final Offset offset;
  final double spreadRadius;
  final double blurRadius;

  const GlowButton({
    Key key,
    @required this.child,
    this.width,
    this.height,
    this.padding,
    this.color,
    this.disableColor,
    this.glowColor,
    this.borderRadius,
    this.border,
    this.isDisable = false,
    this.offset,
    this.spreadRadius,
    this.blurRadius,
    @required this.onPressed,
  }) : super(key: key);

  bool get enable => (onPressed != null && !isDisable);

  bool get disable => !enable;

  @override
  Widget build(BuildContext context) {
    final buttonTheme = Theme.of(context).buttonTheme;

    final buttonColor = _buildButtonColor(context);

    final glowTheme = GlowTheme.of(context);
    return Opacity(
      opacity: enable ? 1.0 : 0.4,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: borderRadius ?? BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: glowColor ?? glowTheme.glowColor ?? buttonColor ?? kDefaultGlowTheme.glowColor,
              offset: offset ?? glowTheme?.offset ?? kDefaultGlowTheme.offset,
              blurRadius: offset ?? glowTheme?.blurRadius ?? kDefaultGlowTheme.blurRadius,
              spreadRadius: offset ?? glowTheme?.spreadRadius ?? kDefaultGlowTheme.spreadRadius,
            ),
          ],
          border: border,
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: borderRadius ?? BorderRadius.circular(24),
            enableFeedback: false,
            onTap: onPressed,
            child: Container(
              height: height ?? buttonTheme.height,
              width: width ?? buttonTheme.minWidth,
              alignment: Alignment.center,
              padding: padding ?? buttonTheme.padding,
              child: DefaultTextStyle(
                child: child,
                style: Theme.of(context).textTheme.button,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Color _buildButtonColor(BuildContext context) {
    return enable
        ? color ?? Theme.of(context).buttonTheme.colorScheme.primary
        : disableColor ?? Theme.of(context).buttonTheme.colorScheme.primary;
  }
}
