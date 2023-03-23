import 'package:dio/dio.dart';
import '../model/login_model.dart';
import '../../../../../product/model/token_model.dart';

abstract class ILoginService {
  final Dio _dio;

  ILoginService(this._dio);

  Future<TokenModel?> login(LoginModel model);
}

class LoginService extends ILoginService {
  LoginService(super.dio);

  @override
  Future<TokenModel?> login(LoginModel model) async {
    final response = await _dio.post('api/login', data: model.toJson());

    if (response.statusCode == 200) {
      return TokenModel.fromJson(response.data);
    } else {
      throw Exception('LOGIN FAILED.');
    }
  }
}
