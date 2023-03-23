// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_change_mobx.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ThemeChange on _ThemeChangeBase, Store {
  Computed<ThemeData>? _$currentThemeComputed;

  @override
  ThemeData get currentTheme =>
      (_$currentThemeComputed ??= Computed<ThemeData>(() => super.currentTheme,
              name: '_ThemeChangeBase.currentTheme'))
          .value;

  late final _$isDarkThemeAtom =
      Atom(name: '_ThemeChangeBase.isDarkTheme', context: context);

  @override
  bool get isDarkTheme {
    _$isDarkThemeAtom.reportRead();
    return super.isDarkTheme;
  }

  @override
  set isDarkTheme(bool value) {
    _$isDarkThemeAtom.reportWrite(value, super.isDarkTheme, () {
      super.isDarkTheme = value;
    });
  }

  late final _$_ThemeChangeBaseActionController =
      ActionController(name: '_ThemeChangeBase', context: context);

  @override
  void changeTheme() {
    final _$actionInfo = _$_ThemeChangeBaseActionController.startAction(
        name: '_ThemeChangeBase.changeTheme');
    try {
      return super.changeTheme();
    } finally {
      _$_ThemeChangeBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isDarkTheme: ${isDarkTheme},
currentTheme: ${currentTheme}
    ''';
  }
}
