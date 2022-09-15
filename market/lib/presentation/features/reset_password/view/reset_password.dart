import 'package:market/data/domain/form_input.dart';
import 'package:market/presentation/features/reset_password/bloc/bloc.dart';
import 'package:market/presentation/widgets/button.dart';
import 'package:market/resources/info.dart';
import 'package:market/resources/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Reset Password")),
      body: BlocProvider(
        create: (context) => ResetPasswordBloc(),
        child: _ResetPasswordView(),
      ),
    );
  }
}

class _ResetPasswordView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ResetPasswordBloc, ResetPasswordState>(
      builder: (context, state) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Form(
          key: context.read<ResetPasswordBloc>().formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 20,
              ),
              BlocBuilder<ResetPasswordBloc, ResetPasswordState>(
                buildWhen: (previous, current) => current.step != previous.step,
                builder: (context, state) {
                  if (state.step == PasswordResetStep.one) return _Email();
                  return Column(
                    children: [
                      _ResetCode(),
                      _Password(),
                    ],
                  );
                },
              ),
              const SizedBox(
                height: 10,
              ),
              SubmitButton(
                handlePress: () =>
                    context.read<ResetPasswordBloc>().submitForm(),
                text: "Submit",
              )
            ],
          ),
        ),
      ),
      listener: (context, state) {
        if (state.message != null) {
          context.snackBar(state.message!);
        }
      },
    );
  }
}

class _Email extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        onChanged: (value) =>
            context.read<ResetPasswordBloc>().emailChanged(value),
        decoration: AppTheme.inputDecoration.copyWith(
          label: const Text("Email"),
          prefixIcon: const Icon(Icons.email),
        ),
        keyboardType: TextInputType.emailAddress,
        validator: (value) => Email.valueValidator(value),
      ),
    );
  }
}

class _Password extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        onChanged: (value) =>
            context.read<ResetPasswordBloc>().passwordChanged(value),
        decoration: AppTheme.inputDecoration.copyWith(
          label: const Text("New Password"),
          prefixIcon: const Icon(Icons.lock),
        ),
        validator: (value) => Password.valueValidator(value),
      ),
    );
  }
}

class _ResetCode extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        onChanged: (value) =>
            context.read<ResetPasswordBloc>().resetCodehanged(value),
        decoration: AppTheme.inputDecoration.copyWith(
          label: const Text("Reset Code"),
          prefixIcon: const Icon(Icons.abc),
        ),
        validator: requiredValidator,
      ),
    );
  }
}
