import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_mobx/features/login/model/login_model.dart';
import 'package:login_mobx/features/login/service/login_service.dart';
import 'package:mobx/mobx.dart';
import '../../../next_page.dart';

part 'login_view_model.g.dart';

class LoginViewModel = _LoginViewModelBase with _$LoginViewModel;

abstract class _LoginViewModelBase with Store {
  _LoginViewModelBase(ILoginService loginService)
      : _loginService = loginService;
  final ILoginService _loginService;

  @observable
  bool isLoading = false;

  @action
  void changeLoading() {
    isLoading = !isLoading;
  }

  @action
  Future<void> checkUser(
      String email, String password, BuildContext context) async {
    changeLoading();
    final response =
        await _loginService.login(LoginModel(email: email, password: password));
    if (response != null) {
      navigateTo(context);
    }
    changeLoading();
  }

  void navigateTo(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const NextPage(),
      ),
    );
  }
}
