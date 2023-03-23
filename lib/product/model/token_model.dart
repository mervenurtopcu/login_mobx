import 'package:json_annotation/json_annotation.dart';


part 'token_model.g.dart';

@JsonSerializable()
class TokenModel{
  String? token;

  TokenModel({this.token});

  factory TokenModel.fromJson(Map<String, dynamic> json) {
    return _$TokenModelFromJson(json);
  }

  //Bu kullanılmayacak
  Map<String, dynamic> toJson() {
    return _$TokenModelToJson(this);
  }

}
