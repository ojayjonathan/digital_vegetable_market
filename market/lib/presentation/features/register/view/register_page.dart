import 'package:market/resources/info.dart';
import 'package:market/presentation/features/register/bloc/bloc.dart';
import 'package:market/presentation/features/register/view/register_form.dart';
import 'package:market/resources/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Register",
          textAlign: TextAlign.center,
        ),
      ),
      body: BlocProvider(
        create: (context) => RegisterCupit(),
        child: Align(
          alignment: Alignment.center,
          child: SizedBox(
            width: MediaQuery.of(context).size.width * .9,
            child: _RegisterView(),
          ),
        ),
      ),
    );
  }
}

class _RegisterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCupit, RegisterState>(
      listener: (context, state) {
        if (state.message != null) {
          context.snackBar(state.message!);
        }
        if (state.status == FormzStatus.submissionSuccess) {
          context.goNamed(RouteNames.login);
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
          const RegisterForm(),
          // const Spacer(),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account? ",
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                InkWell(
                  onTap: () => context.goNamed(RouteNames.login),
                  child: Text(
                    'Sign in',
                    style: TextStyle(
                        color: Theme.of(context).primaryColorDark,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
