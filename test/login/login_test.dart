import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:login_mobx/features/login/model/login_model.dart';
import 'package:login_mobx/features/login/service/login_service.dart';

void main() {
  late ILoginService loginService;
  setUp(() {
    loginService =
        LoginService(Dio(BaseOptions(baseUrl: 'https://reqres.in/')));
  });
  test('Login Test -eve.holt@reqres.in & cityslicka ', () async {
    final response = await loginService
        .login(LoginModel(email: 'eve.holt@reqres.in', password: 'cityslicka'));
    expect(response?.token, isNotNull);
  });
}
