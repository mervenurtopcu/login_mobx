import 'package:flutter/material.dart';
import 'package:login_mobx/product/theme/theme_dark.dart';
import 'package:login_mobx/product/theme/theme_light.dart';
import 'package:mobx/mobx.dart';

part 'theme_change_mobx.g.dart';

class ThemeChange = _ThemeChangeBase with _$ThemeChange;

abstract class _ThemeChangeBase with Store {
  @observable
  bool isDarkTheme = false;

  @action
  void changeTheme() {

    isDarkTheme = !isDarkTheme;

  }

  @computed
  ThemeData get currentTheme =>
      !isDarkTheme ? DarkTheme().theme : LightTheme().theme;
}
