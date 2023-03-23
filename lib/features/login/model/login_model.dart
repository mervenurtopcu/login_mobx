import 'package:json_annotation/json_annotation.dart';


part 'login_model.g.dart';

@JsonSerializable()
class LoginModel {
  String? email;
  String? password;

  LoginModel({this.email, this.password});

  //Bu kullanılmayacak
  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return _$LoginModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$LoginModelToJson(this);
  }
}
