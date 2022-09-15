part of 'bloc.dart';

abstract class OrderHistoryEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class OrderHistoryStarted extends OrderHistoryEvent {}

class OrderHistoryLoaded extends OrderHistoryEvent {
  final List<Order> order;
  OrderHistoryLoaded(this.order);
  @override
  List<Object?> get props => [order];
}

class OrderHistoryRefreshed extends OrderHistoryEvent {}
