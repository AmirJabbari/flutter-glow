import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

import '../../flutter_glow.dart';

class GlowText extends Text {
  const GlowText(
    this.data, {
    Key key,
    this.style,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.glowColor,
    this.offset,
    this.blurRadius,
  })  : assert(
          data != null,
          'A non-null String must be provided to a Text widget.',
        ),
        textSpan = null,
        super(data, key: key);

  final String data;

  final InlineSpan textSpan;

  final TextStyle style;

  final StrutStyle strutStyle;

  final TextAlign textAlign;

  final TextDirection textDirection;

  final Locale locale;

  final bool softWrap;

  final TextOverflow overflow;

  final double textScaleFactor;

  final int maxLines;

  final String semanticsLabel;

  final TextWidthBasis textWidthBasis;

  //glow properties
  final Color glowColor;
  final Offset offset;
  final double blurRadius;

  @override
  Widget build(BuildContext context) {
    final glowTheme = GlowTheme.of(context); // getting glow theme
    final DefaultTextStyle defaultTextStyle = DefaultTextStyle.of(context);
    TextStyle effectiveTextStyle = style;
    if (style == null || style.inherit) effectiveTextStyle = defaultTextStyle.style.merge(style);
    if (MediaQuery.boldTextOverride(context))
      effectiveTextStyle = effectiveTextStyle.merge(const TextStyle(fontWeight: FontWeight.bold));

    final glowColorValue = glowColor ??
        glowTheme?.glowColor ??
        effectiveTextStyle.color ??
        kDefaultGlowTheme.glowColor;
    final glowOffset = offset ?? glowTheme?.offset ?? kDefaultGlowTheme.offset;
    final double glowBlurRadius =
        blurRadius ?? glowTheme?.blurRadius ?? kDefaultGlowTheme.blurRadius;
    effectiveTextStyle = effectiveTextStyle.merge(
      TextStyle(
        shadows: [
          Shadow(
            color: glowColorValue,
            offset: glowOffset,
            blurRadius: glowBlurRadius * 2,
          ),
        ],
      ),
    );

    Widget result = RichText(
      textAlign: textAlign ?? defaultTextStyle.textAlign ?? TextAlign.start,
      textDirection: textDirection,
      // RichText uses Directionality.of to obtain a default if this is null.
      locale: locale,
      // RichText uses Localizations.localeOf to obtain a default if this is null
      softWrap: softWrap ?? defaultTextStyle.softWrap,
      overflow: overflow ?? defaultTextStyle.overflow,
      textScaleFactor: textScaleFactor ?? MediaQuery.textScaleFactorOf(context),
      maxLines: maxLines ?? defaultTextStyle.maxLines,
      strutStyle: strutStyle,
      textWidthBasis: textWidthBasis ?? defaultTextStyle.textWidthBasis,
      text: TextSpan(
        style: effectiveTextStyle,
        text: data,
        children: textSpan != null ? <TextSpan>[textSpan] : null,
      ),
    );
    if (semanticsLabel != null) {
      result = Semantics(
        textDirection: textDirection,
        label: semanticsLabel,
        child: ExcludeSemantics(
          child: result,
        ),
      );
    }
    return result;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('data', data, showName: false));
    if (textSpan != null) {
      properties.add(
          textSpan.toDiagnosticsNode(name: 'textSpan', style: DiagnosticsTreeStyle.transition));
    }
    style?.debugFillProperties(properties);
    properties.add(EnumProperty<TextAlign>('textAlign', textAlign, defaultValue: null));
    properties.add(EnumProperty<TextDirection>('textDirection', textDirection, defaultValue: null));
    properties.add(DiagnosticsProperty<Locale>('locale', locale, defaultValue: null));
    properties.add(FlagProperty('softWrap',
        value: softWrap,
        ifTrue: 'wrapping at box width',
        ifFalse: 'no wrapping except at line break characters',
        showName: true));
    properties.add(EnumProperty<TextOverflow>('overflow', overflow, defaultValue: null));
    properties.add(DoubleProperty('textScaleFactor', textScaleFactor, defaultValue: null));
    properties.add(IntProperty('maxLines', maxLines, defaultValue: null));
    if (semanticsLabel != null) {
      properties.add(StringProperty('semanticsLabel', semanticsLabel));
    }
  }
}
