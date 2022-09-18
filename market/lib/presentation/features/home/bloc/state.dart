part of 'bloc.dart';

class ProductState extends Equatable {
  final ProductsPage productsPage;
  final ServiceStatus status;
  final InfoMessage? message;
  const ProductState({
    this.status = ServiceStatus.initial,
    this.message,
    required this.productsPage,
  });
  @override
  List<Object?> get props => [productsPage, message, status];

  ProductState copyWith({
    ServiceStatus? status,
    ProductsPage? products,
    InfoMessage? message,
  }) =>
      ProductState(
        message: message,
        status: status ?? this.status,
        productsPage: products ?? productsPage,
      );
}
