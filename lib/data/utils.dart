import 'package:freezed_annotation/freezed_annotation.dart';

const dateTimeJsonConverter = DateTimeJsonConverter();

class DateTimeJsonConverter extends JsonConverter<DateTime, int> {
  const DateTimeJsonConverter();

  @override
  DateTime fromJson(int json) => DateTime.fromMillisecondsSinceEpoch(json);

  @override
  int toJson(DateTime object) => object.millisecondsSinceEpoch;
}
