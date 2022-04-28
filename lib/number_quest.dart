import 'package:json_annotation/json_annotation.dart';
part 'number_quest.g.dart';

@JsonSerializable()
class NumberQuestion {
  String q;
  int o1;
  int o2;
  int o3;
  int o4;
  int co;

  NumberQuestion({this.q, this.o1, this.o2, this.o3, this.o4, this.co});

  factory NumberQuestion.fromJson(Map<String, dynamic> json) =>
      _$NumberQuestionFromJson(json);
  Map<String, dynamic> toJson() => _$NumberQuestionToJson(this);
}
