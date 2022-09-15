import 'package:market/presentation/features/login/bloc/bloc.dart';
import 'package:market/presentation/widgets/button.dart';
import 'package:market/resources/theme.dart';
import 'package:market/resources/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: <Widget>[
          _PhoneNumber(),
          _Password(),
          _Row(),
          BlocBuilder<LoginCubit, LoginState>(
            buildWhen: (previous, current) => previous.status != current.status,
            builder: (context, state) {
              if (state.status == FormzStatus.submissionInProgress) {
                return const ButtonLoading(text: "SIGN IN");
              }
              return SubmitButton(
                handlePress: () => context.read<LoginCubit>().passwordLogin(),
                text: "SIGN IN",
              );
            },
          )
        ],
      ),
    );
  }
}

class _Password extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: BlocBuilder<LoginCubit, LoginState>(
        buildWhen: (previous, current) =>
            previous.password != current.password ||
            current.status != previous.status,
        builder: (context, state) => TextFormField(
          onChanged: (value) =>
              context.read<LoginCubit>().passwordChanged(value),
          obscureText: true,
          decoration: AppTheme.inputDecoration.copyWith(
              errorText: state.status == FormzStatus.pure
                  ? null
                  : state.password.error,
              label: const Text("Password"),
              prefixIcon: const Icon(Icons.lock)),
        ),
      ),
    );
  }
}

class _PhoneNumber extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: BlocBuilder<LoginCubit, LoginState>(
        buildWhen: (previous, current) =>
            previous.phone != current.phone ||
            current.status != previous.status,
        builder: (context, state) => TextFormField(
          onChanged: (value) => context.read<LoginCubit>().phoneChanged(value),
          decoration: AppTheme.inputDecoration.copyWith(
            errorText:
                state.status == FormzStatus.pure ? null : state.phone.error,
            label: const Text("PhoneNumber"),
            prefixIcon: const Icon(Icons.phone),
          ),
          keyboardType: TextInputType.number,
        ),
      ),
    );
  }
}

class _Row extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            BlocBuilder<LoginCubit, LoginState>(
              buildWhen: (previous, current) =>
                  previous.rememberMe != current.rememberMe,
              builder: (context, state) => Switch(
                value: state.rememberMe,
                onChanged: (value) =>
                    context.read<LoginCubit>().rememberMeChanged(value),
              ),
            ),
            const Text("Remember me")
          ],
        ),
        TextButton(
          onPressed: () => context.pushNamed(RouteNames.resetPassword),
          child: Text(
            'Forgot Password?',
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ),
      ],
    );
  }
}
