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
  final String? variety;

  const CartItemUpdated({required this.product, required this.quantity, this.variety});
  @override
  List<Object?> get props => [product, quantity, variety];
}

class CartItemAdded extends AppEvent {
  final Product product;
  final double quantity;
  final String? variety;
  const CartItemAdded(
      {required this.product, required this.quantity, this.variety});
  @override
  List<Object?> get props => [product, quantity, variety];
}

class OrderPlaced extends AppEvent {}
