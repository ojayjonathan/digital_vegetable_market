part of 'bloc.dart';

class AppState extends Equatable {
  final Cart cart;
  final List<Address> address;
  final ServiceStatus status;
  final InfoMessage? message;
  final Address? selectedAddress;
  const AppState({
    this.selectedAddress,
    this.cart = const Cart(),
    this.address = const [],
    this.status = ServiceStatus.initial,
    this.message,
  });
  AppState copyWith({
    Cart? cart,
    List<Address>? address,
    ServiceStatus? status,
    InfoMessage? message,
    Address? selectedAddress,
  }) {
    return AppState(
      message: message,
      cart: cart ?? this.cart,
      address: address ?? this.address,
      status: status ?? this.status,
      selectedAddress: selectedAddress ?? this.selectedAddress,
    );
  }

  @override
  List<Object?> get props => [cart, address, status, selectedAddress, message];
}
