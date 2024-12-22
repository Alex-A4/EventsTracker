import 'dart:ui';

import 'package:json_annotation/json_annotation.dart';

const colorJsonConverter = ColorJsonConverter();

class ColorJsonConverter extends JsonConverter<Color, int> {
  const ColorJsonConverter();

  @override
  Color fromJson(int json) => Color(json);

  @override
  int toJson(Color object) => object.value;
}
