part of 'account_page.dart';

class _PasswordChange extends StatelessWidget {
  _PasswordChange({Key? key}) : super(key: key);
  final _currentPassword = TextEditingController();
  final _newPassword = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    updatePassword() async {
      if (_formKey.currentState!.validate()) {
        context.snackBar(
          const InfoMessage(
              message: "Updating password...", type: MessageType.success),
        );
        final res = await service<UserAccount>()
            .passwordChange(_currentPassword.text, _newPassword.text);
        res.when(
          onError: (error) => context.snackBar(InfoMessage.fromError(error)),
          onSuccess: (data) => context.snackBar(
            const InfoMessage(
              message: "Password updated",
              type: MessageType.success,
            ),
          ),
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Change Password"),
      ),
      body: Form(
        key: _formKey,
        child: Align(
          alignment: Alignment.topCenter,
          child: SizedBox(
            width: MediaQuery.of(context).size.width * .9,
            child: Column(
              children: [
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: AppTheme.inputDecoration.copyWith(
                      label: const Text("Current password"),
                      prefixIcon: const Icon(Icons.lock),
                    ),
                    controller: _currentPassword,
                    validator: validator,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: AppTheme.inputDecoration.copyWith(
                      label: const Text("New password"),
                      prefixIcon: const Icon(Icons.lock),
                    ),
                    validator: validator,
                    controller: _newPassword,
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SubmitButton(
                    handlePress: () => updatePassword(),
                    text: "SUBMIT",
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

String? validator(String? value) {
  if (value == null) {
    return "Required";
  }
  if (value.length < 4) {
    return "Password too short";
  }
  return null;
}
