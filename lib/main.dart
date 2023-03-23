import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:login_mobx/product/global/theme_change_mobx.dart';
import 'package:provider/provider.dart';
import 'features/login/view/login_view.dart';

void main() => runApp(MultiProvider(providers: [
      Provider<ThemeChange>(
        create: (_) => ThemeChange(),
      )
    ], child: MyApp()));

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final themeStore = ThemeChange();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return MaterialApp(
          title: 'Material App',
          debugShowCheckedModeBanner: false,
          theme: context.watch<ThemeChange>().currentTheme,
          home: const LoginView(),
        );
      },
    );
  }
}
