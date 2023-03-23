part of 'login_view.dart';

class EmailPasswordTextFormField extends StatelessWidget {
  const EmailPasswordTextFormField({
    super.key,
    required TextEditingController emailController,
    required TextEditingController passwordController,
  })  : _emailController = emailController,
        _passwordController = passwordController;

  final TextEditingController _emailController;
  final TextEditingController _passwordController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: _emailController,
          decoration: const InputDecoration(labelText: 'Email'),
          cursorColor: Colors.black,
          validator: (value) {
            if (!value!.contains('@')) {
              return "Please enter a valid email address";
            }
            return null;
          },
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.04,
        ),
        TextFormField(
          controller: _passwordController,
          decoration: const InputDecoration(labelText: 'Password'),
          obscureText: true,
          cursorColor: Colors.black,
          validator: (String? data) => ((data?.length ?? 0) > 6)
              ? null
              : 'Password must be at least 6 characters',
        ),
      ],
    );
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
    required LoginViewModel loginViewModel,
    required GlobalKey<FormState> formLoginKey,
    required TextEditingController emailController,
    required TextEditingController passwordController,
  })  : _loginViewModel = loginViewModel,
        _formLoginKey = formLoginKey,
        _emailController = emailController,
        _passwordController = passwordController;

  final LoginViewModel _loginViewModel;
  final GlobalKey<FormState> _formLoginKey;
  final TextEditingController _emailController;
  final TextEditingController _passwordController;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return _loginViewModel.isLoading
            ? const CircularProgressIndicator()
            : ElevatedButton(
                onPressed: () async {
                  if (_formLoginKey.currentState!.validate()) {
                    await _loginViewModel.checkUser(_emailController.text,
                        _passwordController.text, context);
                  }
                },
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(MediaQuery.of(context).size.width * 0.8,
                        MediaQuery.of(context).size.height * 0.07)),
                child: const Text("Login"),
              );
      },
    );
  }
}
