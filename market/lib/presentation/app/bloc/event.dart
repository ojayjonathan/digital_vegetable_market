part of 'bloc.dart';

abstract class AppEvent extends Equatable {
  const AppEvent();
  @override
  List<Object?> get props => [];
}

class AddressStarted extends AppEvent {}

class AddressDeleted extends AppEvent {
  final Address address;
  const AddressDeleted(this.address);
  @override
  List<Object?> get props => [address];
}

class AddressCreated extends AppEvent {
  final Address address;
  const AddressCreated(this.address);
  @override
  List<Object?> get props => [address];
}

class AddressSelected extends AppEvent {
  final Address address;
  const AddressSelected(this.address);
  @override
  List<Object?> get props => [address];
}

class CartItemRemoved extends AppEvent {
  final OrderItem item;
  const CartItemRemoved(this.item);
  @override
  List<Object?> get props => [item];
}

class CartItemUpdated extends AppEvent {
  final Product product;
  final double quantity;
  const CartItemUpdated({required this.product, required this.quantity});
  @override
  List<Object?> get props => [product, quantity];
}

class CartItemAdded extends AppEvent {
  final Product product;
  final double quantity;
  const CartItemAdded({required this.product, required this.quantity});
  @override
  List<Object?> get props => [product, quantity];
}

class OrderPlaced extends AppEvent{}