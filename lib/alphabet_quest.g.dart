// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alphabet_quest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AlphaQuestion _$AlphaQuestionFromJson(Map<String, dynamic> json) {
  return AlphaQuestion(
    q: json['q'] as String,
    o1: json['o1'] as String,
    o2: json['o2'] as String,
    o3: json['o3'] as String,
    o4: json['o4'] as String,
    co: json['co'] as String,
  );
}

Map<String, dynamic> _$AlphaQuestionToJson(AlphaQuestion instance) =>
    <String, dynamic>{
      'q': instance.q,
      'o1': instance.o1,
      'o2': instance.o2,
      'o3': instance.o3,
      'o4': instance.o4,
      'co': instance.co,
    };
