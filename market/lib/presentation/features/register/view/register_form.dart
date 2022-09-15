import 'package:market/presentation/features/register/bloc/bloc.dart';
import 'package:market/presentation/widgets/button.dart';
import 'package:market/resources/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: <Widget>[
          _FirstName(),
          _LastName(),
          _Email(),
          _Password(),
          const SizedBox(height: 10),
          BlocBuilder<RegisterCupit, RegisterState>(
            buildWhen: (previous, current) => previous.status != current.status,
            builder: (context, state) {
              if (state.status == FormzStatus.submissionInProgress) {
                return const ButtonLoading(text: "Register");
              }
              return SubmitButton(
                handlePress: () =>
                    context.read<RegisterCupit>().passwordRegister(),
                text: "Register",
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
      child: BlocBuilder<RegisterCupit, RegisterState>(
        buildWhen: (previous, current) =>
            previous.password != current.password ||
            current.status != previous.status ||
            current.fieldError != previous.fieldError,
        builder: (context, state) => TextFormField(
          onChanged: (value) =>
              context.read<RegisterCupit>().passwordChanged(value),
          obscureText: true,
          decoration: AppTheme.inputDecoration.copyWith(
            errorText:
                state.status == FormzStatus.pure ? null : state.password.error,
            label: const Text("Password"),
            prefixIcon: const Icon(Icons.lock),
          ),
        ),
      ),
    );
  }
}

class _Email extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: BlocBuilder<RegisterCupit, RegisterState>(
        buildWhen: (previous, current) =>
            previous.email != current.email ||
            current.status != previous.status ||
            current.fieldError != previous.fieldError,
        builder: (context, state) => TextFormField(
          onChanged: (value) =>
              context.read<RegisterCupit>().emailChanged(value),
          decoration: AppTheme.inputDecoration.copyWith(
            errorText: state.status == FormzStatus.pure
                ? null
                : (state.fieldError["email"] ?? state.email.error),
            label: const Text("Email"),
            prefixIcon: const Icon(Icons.email),
          ),
        ),
      ),
    );
  }
}

class _FirstName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: BlocBuilder<RegisterCupit, RegisterState>(
        buildWhen: (previous, current) =>
            previous.firstName != current.firstName ||
            current.status != previous.status ||
            current.fieldError != previous.fieldError,
        builder: (context, state) => TextFormField(
          onChanged: (value) =>
              context.read<RegisterCupit>().firstNameChanged(value),
          decoration: AppTheme.inputDecoration.copyWith(
            errorText: state.status == FormzStatus.pure
                ? null
                : (state.fieldError["firstName"] ?? state.firstName.error),
            label: const Text("First name"),
            prefixIcon: const Icon(Icons.person),
          ),
        ),
      ),
    );
  }
}

class _LastName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: BlocBuilder<RegisterCupit, RegisterState>(
        buildWhen: (previous, current) =>
            previous.lastName != current.lastName ||
            current.status != previous.status ||
            current.fieldError != previous.fieldError,
        builder: (context, state) => TextFormField(
          onChanged: (value) =>
              context.read<RegisterCupit>().lastNameChanged(value),
          decoration: AppTheme.inputDecoration.copyWith(
            errorText: state.status == FormzStatus.pure
                ? null
                : (state.fieldError["lastName"] ?? state.lastName.error),
            label: const Text("Last name"),
            prefixIcon: const Icon(Icons.person),
          ),
        ),
      ),
    );
  }
}
