part of "bloc.dart";

class UserProductsState extends Equatable {
  final List<Product> products;
  final ServiceStatus status;
  final InfoMessage? message;

  const UserProductsState({
    this.products = const [],
    this.message,
    this.status = ServiceStatus.initial,
  });
  UserProductsState copyWith({
    List<Product>? products,
    ServiceStatus? status,
    InfoMessage? message,
  }) {
    return UserProductsState(
      products: products ?? this.products,
      status: status ?? this.status,
      message: message,
    );
  }

  @override
  List<Object?> get props => [products, message, status];
}
