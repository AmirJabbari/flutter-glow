import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';

class GlowSwitch extends StatefulWidget {
  const GlowSwitch({
    Key? key,
    required this.value,
    required this.onChanged,
    this.activeColor,
    this.dragStartBehavior,
    this.glowColor,
    this.offset,
    this.spreadRadius,
    this.blurRadius,
  }) : super(key: key);

  final bool value;
  final ValueChanged<bool>? onChanged;
  final Color? activeColor;
  final DragStartBehavior? dragStartBehavior;

  //glow properties
  final Color? glowColor;
  final Offset? offset;
  final double? spreadRadius;
  final double? blurRadius;

  bool get enable => onChanged != null;

  @override
  _GlowSwitchState createState() => _GlowSwitchState();
}

class _GlowSwitchState extends State<GlowSwitch> {
  @override
  Widget build(BuildContext context) {
    final glowTheme = GlowTheme.of(context);

    final color = _buildGlowColor(context);

    return GlowContainer(
      padding: EdgeInsets.all(0),
      borderRadius: BorderRadius.circular(100),
      glowColor: widget.enable ? color : color!.withOpacity(0.4),
      offset: widget.offset ?? glowTheme?.offset ?? kDefaultGlowTheme.offset,
      blurRadius: widget.blurRadius ?? glowTheme?.blurRadius ?? kDefaultGlowTheme.blurRadius,
      spreadRadius:
          widget.spreadRadius ?? glowTheme?.spreadRadius ?? kDefaultGlowTheme.spreadRadius,
      child: CupertinoSwitch(
        value: widget.value,
        onChanged: widget.onChanged,
        activeColor: widget.activeColor,
        dragStartBehavior: widget.dragStartBehavior ?? DragStartBehavior.start,
      ),
    );
  }

  Color? _buildGlowColor(BuildContext context) {
    final glowTheme = GlowTheme.of(context);
    if (widget.value) {
      return widget.glowColor ??
          glowTheme?.glowColor ??
          widget.activeColor ??
          kDefaultGlowTheme.glowColor;
    } else
      return Color(0x00000000);
  }
}
