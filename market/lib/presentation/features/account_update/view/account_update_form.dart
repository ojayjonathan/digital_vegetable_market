import 'package:market/data/services/status.dart';
import 'package:market/presentation/features/account/bloc/bloc.dart';
import 'package:market/presentation/features/account_update/bloc/bloc.dart';
import 'package:market/presentation/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class AccountUpdateForm extends StatelessWidget {
  const AccountUpdateForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Personal Information',
            style: Theme.of(context).textTheme.headline4,
          ),
          _labelText('First Name'),
          _FirstName(),
          _labelText('Last Name'),
          _LastName(),
          _labelText('Email'),
          _Email(),
          const _UpdateButton()
        ],
      ),
    );
  }

  Widget _labelText(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        label,
        style: const TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class _Email extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountUpdateCupit, AccountUpdateState>(
      buildWhen: (previous, current) =>
          previous.email != current.email || current.status == previous.status,
      builder: (context, state) => TextFormField(
        initialValue: state.email.value,
        onChanged: (value) =>
            context.read<AccountUpdateCupit>().emailChanged(value),
        decoration: InputDecoration(
          errorText: state.status == FormzStatus.pure
              ? null
              : state.email.error ?? state.fieldErrors["email"],
        ),
      ),
    );
  }
}

class _FirstName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountUpdateCupit, AccountUpdateState>(
      buildWhen: (previous, current) =>
          previous.firstName != current.firstName ||
          current.status == previous.status,
      builder: (context, state) => TextFormField(
        initialValue: state.firstName.value,
        onChanged: (value) =>
            context.read<AccountUpdateCupit>().firstNameChanged(value),
        decoration: InputDecoration(
          errorText: state.status == FormzStatus.pure
              ? null
              : state.firstName.error ?? state.fieldErrors["firstName"],
        ),
      ),
    );
  }
}

class _LastName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountUpdateCupit, AccountUpdateState>(
      buildWhen: (previous, current) =>
          previous.lastName != current.lastName ||
          current.status == previous.status,
      builder: (context, state) => TextFormField(
        initialValue: state.lastName.value,
        onChanged: (value) =>
            context.read<AccountUpdateCupit>().lastNameChanged(value),
        decoration: InputDecoration(
          errorText: state.status == FormzStatus.pure
              ? null
              : state.lastName.error ?? state.fieldErrors["lastName"],
        ),
      ),
    );
  }
}

class _UpdateButton extends StatelessWidget {
  const _UpdateButton();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 0),
      child: BlocBuilder<AccountBloc, AccountState>(
        buildWhen: (previous, current) =>
            previous.profileStatus != current.profileStatus,
        builder: (context, state) {
          if (state.profileStatus == ServiceStatus.submissionInProgress) {
            return const ButtonLoading(text: "Updating...");
          }
          return SubmitButton(
            handlePress: () =>
                context.read<AccountUpdateCupit>().updateProfile(),
            text: "Update",
          );
        },
      ),
    );
  }
}
