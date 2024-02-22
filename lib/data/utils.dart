import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

const dateTimeJsonConverter = DateTimeJsonConverter();
const colorJsonConverter = ColorJsonConverter();

class DateTimeJsonConverter extends JsonConverter<DateTime, int> {
  const DateTimeJsonConverter();

  @override
  DateTime fromJson(int json) => DateTime.fromMillisecondsSinceEpoch(json);

  @override
  int toJson(DateTime object) => object.millisecondsSinceEpoch;
}

class ColorJsonConverter extends JsonConverter<Color, int> {
  const ColorJsonConverter();

  @override
  Color fromJson(int json) => Color(json);

  @override
  int toJson(Color object) => object.value;
}

extension ColorX on Color {
  Color get eventBackgroundColor {
    return withOpacity(0.2);
  }

  Border get eventBorder {
    final hsl = HSLColor.fromColor(this);
    final hslLight = hsl.withLightness((hsl.lightness - 0.1).clamp(0.0, 1.0));

    return Border.all(color: hslLight.toColor());
  }

  Gradient get eventGradient {
    return LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      stops: const [0, 0.3, 0.6, 1],
      colors: [
        withOpacity(0.4),
        withOpacity(0.6),
        withOpacity(0.8),
        this,
      ],
    );
  }
}
