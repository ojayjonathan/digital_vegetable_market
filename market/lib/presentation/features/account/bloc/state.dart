part of 'bloc.dart';

class AccountState extends Equatable {
  const AccountState({
    this.profileStatus = ServiceStatus.initial,
    this.user,
    this.message,
    this.home,
    this.work,
  });

  final InfoMessage? message;
  final ServiceStatus profileStatus;
  final User? user;
  final Address? home;
  final Address? work;

  AccountState copyWith({
    ServiceStatus? profileStatus,
    User? user,
    InfoMessage? message,
    Address? home,
    Address? work,
  }) {
    return AccountState(
      profileStatus: profileStatus ?? this.profileStatus,
      user: user ?? this.user,
      message: message,
      home: home ?? this.home,
      work: work ?? this.work,
    );
  }

  @override
  List<Object?> get props => [profileStatus, user, message, work, home];
}
