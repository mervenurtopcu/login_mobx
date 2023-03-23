import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:login_mobx/features/login/service/login_service.dart';
import 'package:login_mobx/features/login/viewModel/login_view_model.dart';
import 'package:login_mobx/product/constants/lottie_path.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import '../../../product/global/theme_change_mobx.dart';

part 'login_view.g.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final GlobalKey<FormState> _formLoginKey = GlobalKey();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final LoginViewModel _loginViewModel = LoginViewModel(
      LoginService(Dio(BaseOptions(baseUrl: 'https://reqres.in/'))));

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeStore = context.read<ThemeChange>();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        actions: [
          Observer(builder: (_) {
            return buildIconButton(themeStore);
          }),
        ],
      ),
      body: Form(
        key: _formLoginKey,
        autovalidateMode: AutovalidateMode.always,
        child: Padding(
          padding: const PagePadding.symmetric(),
          child: Column(
            children: [
              Center(
                child: Observer(
                  builder: (_) {
                    return themeStore.isDarkTheme
                        ? Lottie.asset(LottieItems.login.lottiePath,
                            repeat: false,
                            height: MediaQuery.of(context).size.height * 0.3)
                        : Lottie.asset(LottieItems.loginDark.lottiePath,
                            repeat: false,
                            height: MediaQuery.of(context).size.height * 0.3);
                  },
                ),
              ),
              EmailPasswordTextFormField(
                  emailController: _emailController,
                  passwordController: _passwordController),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              LoginButton(
                  loginViewModel: _loginViewModel,
                  formLoginKey: _formLoginKey,
                  emailController: _emailController,
                  passwordController: _passwordController)
            ],
          ),
        ),
      ),
    );
  }

  IconButton buildIconButton(ThemeChange themeStore) {
    return IconButton(
        onPressed: () {
          themeStore.changeTheme();
        },
        icon: (themeStore.isDarkTheme == true)
            ? const Icon(
                Icons.wb_sunny_outlined,
                color: Colors.yellow,
                size: 30,
              )
            : const Icon(
                Icons.nightlight_round_outlined,
                size: 30,
              ));
  }
}

class PagePadding extends EdgeInsets {
  const PagePadding.symmetric() : super.symmetric(horizontal: 10);
}
