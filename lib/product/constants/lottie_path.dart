enum LottieItems {
  login,
  loginDark,
}

extension LottieExtension on LottieItems {

  String _path(){
    switch(this){
      case LottieItems.login:
        return 'login';
      case LottieItems.loginDark:
        return 'login_dark';
    }
  }
  String get lottiePath => 'assets/lottie/${_path()}.json';
}