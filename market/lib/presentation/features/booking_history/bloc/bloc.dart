import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:market/data/models/order/order.dart';
import 'package:market/data/models/product/product.dart';
import 'package:market/data/models/user/user.dart';
import 'package:market/resources/info.dart';
import 'package:market/data/models/address/address.dart';
import 'package:market/data/services/status.dart';

part 'event.dart';
part 'state.dart';

class OrderHistoryBloc extends Bloc<OrderHistoryEvent, OrderHistoryState> {
  OrderHistoryBloc() : super(const OrderHistoryState()) {
    on<OrderHistoryStarted>(_OrderStarted);
    on<OrderHistoryLoaded>(
      (event, emit) => emit(
        state.copyWith(
          orders: event.order,
          status: ServiceStatus.loadingSuccess,
        ),
      ),
    );
    on<OrderHistoryRefreshed>((event, emit) => null
        //TODO implement refresh
        );
  }

  FutureOr _OrderStarted(
    OrderHistoryStarted event,
    Emitter<OrderHistoryState> emit,
  ) async {
    emit(state.copyWith(status: ServiceStatus.loading));

    //TODO: call Order api
    await Future.delayed(
      const Duration(seconds: 1),
      (() {
        add(
          OrderHistoryLoaded(
            [
              Order(
                user: User(
                    createdAt: DateTime.now(),
                    id: 10,
                    email: "",
                    firstName: "",
                    isFarmer: true,
                    lastName: "",
                    phoneNumber: ""),
                status: OrderStatus.ACTIVE,
                address: Address(
                  latitude: 0,
                  longitude: 0,
                  address: "Njoro, Nairobi, Kenya",
                  title: "Home",
                ),
                id: 100000,
                items: [
                  OrderItem(
                    product: Product(
                      price: 1000,
                      description: "",
                      name: "Product",
                      address: Address(
                        latitude: 0,
                        longitude: 0,
                        address: "Njoro, Nairobi, Kenya",
                        title: "Home",
                      ),
                      availableDate: DateTime.now(),
                      id: 10,
                      imageUrl: "",
                      measurementUnit: "kg",
                      owner: User(
                          createdAt: DateTime.now(),
                          id: 10,
                          email: "",
                          firstName: "",
                          isFarmer: true,
                          lastName: "",
                          phoneNumber: ""),
                    ),
                    quantity: 10,
                    delivered: false,
                    id: 1,
                  )
                ],
                createdAt: DateTime.now(),
              ),
            ],
          ),
        );
      }),
    );
  }
}
