// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'number_quest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NumberQuestion _$NumberQuestionFromJson(Map<String, dynamic> json) {
  return NumberQuestion(
    q: json['q'] as String,
    o1: json['o1'] as int,
    o2: json['o2'] as int,
    o3: json['o3'] as int,
    o4: json['o4'] as int,
    co: json['co'] as int,
  );
}

Map<String, dynamic> _$NumberQuestionToJson(NumberQuestion instance) =>
    <String, dynamic>{
      'q': instance.q,
      'o1': instance.o1,
      'o2': instance.o2,
      'o3': instance.o3,
      'o4': instance.o4,
      'co': instance.co,
    };
