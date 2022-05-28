import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vegetable_marketplace/modules/auth/login/bloc/bloc.dart';
import 'package:vegetable_marketplace/theme/theme.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      children: <Widget>[
        _PhoneNumber(),
        _Password(),
      ],
    ));
  }
}

class _Password extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: BlocBuilder<LoginCubit, LoginState>(
        buildWhen: (previous, current) => previous.password != current.password,
        builder: (context, state) => TextFormField(
          onChanged: (value) =>
              context.read<LoginCubit>().passwordChanged(value),
          obscureText: true,
          decoration: AppTheme.inputDecoration.copyWith(
            errorText: state.password.error,
            label: const Text("Password"),
          ),
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
            previous.phoneNumber != current.phoneNumber,
        builder: (context, state) => TextFormField(
          onChanged: (value) => context.read<LoginCubit>().phoneChanged(value),
          decoration: AppTheme.inputDecoration.copyWith(
            errorText: state.phoneNumber.error,
            label: const Text("Phone Number"),
          ),
        ),
      ),
    );
  }
}
