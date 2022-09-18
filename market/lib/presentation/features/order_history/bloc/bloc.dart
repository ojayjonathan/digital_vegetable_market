import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:market/data/models/order/order.dart';
import 'package:market/data/services/rest/client.dart';
import 'package:market/data/services/service.dart';
import 'package:market/resources/info.dart';
import 'package:market/data/services/status.dart';

part 'event.dart';
part 'state.dart';

class OrderHistoryBloc extends Bloc<OrderHistoryEvent, OrderHistoryState> {
  OrderHistoryBloc() : super(const OrderHistoryState()) {
    on<OrderHistoryStarted>(_orderStarted);
    on<OrderHistoryLoaded>(
      (event, emit) => emit(
        state.copyWith(
          orders: event.order,
          status: ServiceStatus.loadingSuccess,
        ),
      ),
    );
  }

  FutureOr _orderStarted(
    OrderHistoryStarted event,
    Emitter<OrderHistoryState> emit,
  ) async {
    emit(state.copyWith(status: ServiceStatus.loading));
    final res = await service<OrderService>().all();
    res.when(
      onError: (error) => emit(
        state.copyWith(
          status: ServiceStatus.loadingFailure,
          message: InfoMessage.fromError(error),
        ),
      ),
      onSuccess: (data) => emit(
        state.copyWith(status: ServiceStatus.loadingSuccess, orders: data),
      ),
    );
  }
}
