part of 'bloc.dart';

abstract class AccountEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class AccountStarted extends AccountEvent {}

class AccountUpdated extends AccountEvent {
  final User user;
  AccountUpdated(this.user);
  @override
  List<Object?> get props => [user];
}

class AddressCreated extends AccountEvent {
  final Address address;

  AddressCreated(this.address);

  @override
  List<Object?> get props => [address];
}

class AddressUpdate extends AccountEvent {
  final Address address;
  final String id;

  AddressUpdate(this.address, this.id);

  @override
  List<Object?> get props => [address, id];
}
