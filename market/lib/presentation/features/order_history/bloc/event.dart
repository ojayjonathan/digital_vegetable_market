part of 'bloc.dart';

abstract class OrderHistoryEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class OrderHistoryStarted extends OrderHistoryEvent {}

