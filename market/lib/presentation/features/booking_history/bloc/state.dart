part of "bloc.dart";

class OrderHistoryState extends Equatable {
  final List<Order> orders;
  final ServiceStatus status;
  final InfoMessage? message;

  const OrderHistoryState({
    this.orders = const [],
    this.message,
    this.status = ServiceStatus.initial,
  });
  OrderHistoryState copyWith({
    List<Order>? orders,
    ServiceStatus? status,
    InfoMessage? message,
  }) {
    return OrderHistoryState(
      orders: orders ?? this.orders,
      status: status ?? this.status,
      message: message,
    );
  }

  @override
  List<Object?> get props => [orders, message, status];
}
