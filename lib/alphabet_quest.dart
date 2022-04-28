import 'package:json_annotation/json_annotation.dart';
part 'alphabet_quest.g.dart';

@JsonSerializable()
class AlphaQuestion {
  String q;
  String o1;
  String o2;
  String o3;
  String o4;
  String co;

  AlphaQuestion({this.q, this.o1, this.o2, this.o3, this.o4, this.co});

  factory AlphaQuestion.fromJson(Map<String, dynamic> json) =>
      _$AlphaQuestionFromJson(json);
  Map<String, dynamic> toJson() => _$AlphaQuestionToJson(this);
}
