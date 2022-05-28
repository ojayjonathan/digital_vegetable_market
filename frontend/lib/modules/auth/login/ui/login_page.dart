import 'package:flutter/material.dart';
import 'package:vegetable_marketplace/modules/auth/login/ui/widget/login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Login",
          textAlign: TextAlign.center,
        ),
      ),
      body: Column(
        children: const [
          LoginForm(),
        ],
      ),
    );
  }
}
