part of 'bloc.dart';

class AccountUpdateState extends Equatable {
  final Email email;
  final TextInput firstName;
  final FormzStatus status;
  final InfoMessage? message;
  final Map<String, String> fieldErrors;
  final TextInput lastName;

  const AccountUpdateState({
    required this.email,
    required this.firstName,
    this.message,
    this.status = FormzStatus.pure,
    required this.lastName,
    this.fieldErrors = const {},
  });
  @override
  List<Object?> get props => [
        email,
        fieldErrors,
        status,
        message,
        firstName,
        lastName,
      ];

  AccountUpdateState copyWith({
    TextInput? firstName,
    Email? email,
    FormzStatus? status,
    InfoMessage? message,
    Map<String, String> fieldErrors = const {},
    TextInput? lastName,
  }) {
    return AccountUpdateState(
      email: email ?? this.email,
      lastName: lastName ?? this.lastName,
      status: status ?? this.status,
      message: message,
      firstName: firstName ?? this.firstName,
      fieldErrors: fieldErrors,
    );
  }
}
