import 'package:market/data/repository/app.dart';
import 'package:market/resources/info.dart';
import 'package:market/presentation/features/login/bloc/bloc.dart';
import 'package:market/resources/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Sign In",
          textAlign: TextAlign.center,
        ),
      ),
      body: BlocProvider(
        create: (context) => LoginCubit(context.read<AppRepository>()),
        child: Align(
          alignment: Alignment.center,
          child: SizedBox(
            width: MediaQuery.of(context).size.width * .9,
            child: _LoginView(),
          ),
        ),
      ),
    );
  }
}

class _LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.message != null) {
          context.snackBar(state.message!);
        }
      },
      child: ListView(
        children: [
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Image.asset(
                "assets/logo-dark.png",
                height: 40,
              ),
            ),
          ),
          const SizedBox(height: 30),
          const LoginForm(),
          const SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't  have an account? ",
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                  InkWell(
                    onTap: () => context.goNamed(RouteNames.register),
                    child: Text(
                      'Sign up',
                      style: TextStyle(
                          color: Theme.of(context).primaryColorDark,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
