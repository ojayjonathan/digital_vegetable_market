import 'package:market/presentation/features/account/bloc/bloc.dart';
import 'package:market/presentation/features/account/view/widgets.dart';
import 'package:market/presentation/features/account_update/bloc/bloc.dart';
import 'package:market/presentation/features/account_update/view/account_update_form.dart';
import 'package:market/resources/info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountUpdatePage extends StatelessWidget {
  const AccountUpdatePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile Update"),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (context) => AccountUpdateCupit(
          context.read<AccountBloc>(),
        ),
        child: SingleChildScrollView(
          child: Builder(builder: (context) {
            return BlocListener<AccountUpdateCupit, AccountUpdateState>(
              listener: (context, state) {
                if (state.message != null) {
                  context.snackBar(state.message!);
                }
              },
              child: Column(
                children: const [
                  ProfileImage(
                    showUploadIcon: true,
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: AccountUpdateForm(),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
