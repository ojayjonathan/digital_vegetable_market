import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:market/data/models/address/address.dart';
import 'package:market/data/models/cart.dart';
import 'package:market/data/models/order/order.dart';
import 'package:market/data/models/product/product.dart';
import 'package:market/data/repository/app.dart';
import 'package:market/data/repository/shopping.dart';
import 'package:market/data/services/rest/client.dart';
import 'package:market/data/services/service.dart';
import 'package:market/data/services/status.dart';
import 'package:market/resources/info.dart';

part 'event.dart';
part 'state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final ShoppingRepository _repository;
  AppRepository appRepository;
  AppBloc(this._repository, this.appRepository) : super(const AppState()) {
    on<CartItemAdded>(
      (event, emit) {
        emit(
          state.copyWith(
            cart: _repository.addToCart(
              OrderItem(
                product: event.product,
                quantity: event.quantity,
                delivered: false,
                variety: event.variety
              ),
            ),
          ),
        );
      },
    );
    on<CartItemRemoved>(
      (event, emit) => emit(
        state.copyWith(
          cart: _repository.removeFromCart(event.item),
        ),
      ),
    );
    on<CartItemUpdated>((event, emit) => emit(
          state.copyWith(
            cart: _repository.updateCartItem(event.product, event.quantity, event.variety),
          ),
        ));
    on<AddressSelected>(
      (event, emit) => emit(state.copyWith(selectedAddress: event.address)),
    );
    on<AddressStarted>(
      (event, emit) async {
        emit(
          state.copyWith(
            status: ServiceStatus.loading,
          ),
        );
        final res = await appRepository.getAddresses();
        res.when(
          onError: (error) => emit(
            state.copyWith(
              status: ServiceStatus.loadingFailure,
              message: InfoMessage.fromError(error),
            ),
          ),
          onSuccess: (data) {
            Address? selected;
            for (var ad in data) {
              if (ad.isDefault == true) {
                selected = ad;
                break;
              }
            }
            if (selected == null && data.isNotEmpty) {
              selected = data[0];
            }
            emit(
              state.copyWith(
                status: ServiceStatus.loadingSuccess,
                address: data,
                selectedAddress: selected,
              ),
            );
          },
        );
      },
    );
    on<AddressCreated>(
      (event, emit) async {
        emit(
          state.copyWith(
            status: ServiceStatus.loading,
            message: const InfoMessage(
              message: "Creating address",
              type: MessageType.success,
            ),
          ),
        );
        final res = await appRepository.addressCreate(event.address);
        res.when(
          onError: (error) => emit(state.copyWith(
              message: InfoMessage.fromError(error),
              status: ServiceStatus.loadingFailure)),
          onSuccess: (_) => emit(
            state.copyWith(
              status: ServiceStatus.loadingSuccess,
              address: appRepository.addresses,
            ),
          ),
        );
      },
    );
    on<AddressDeleted>(
      (event, emit) async {
        emit(
          state.copyWith(
            status: ServiceStatus.loading,
            message: const InfoMessage(
              message: "Deleting address, please wait...",
              type: MessageType.success,
            ),
          ),
        );
        final res = await appRepository.addressDelete(event.address);
        res.when(
          onError: (error) => emit(
            state.copyWith(
              message: InfoMessage.fromError(error),
              status: ServiceStatus.loadingFailure,
            ),
          ),
          onSuccess: (_) => emit(
            state.copyWith(
              status: ServiceStatus.loadingSuccess,
              address: appRepository.addresses,
            ),
          ),
        );
      },
    );
    on<OrderPlaced>(
      (event, emit) async {
        if (state.selectedAddress != null) {
          emit(
            state.copyWith(
              message: const InfoMessage(
                message: "Submiting your order...",
                type: MessageType.success,
              ),
              status: ServiceStatus.submissionInProgress,
            ),
          );
          final res = await service<OrderService>().create(
              List<OrderItemCreate>.from(
                state.cart.items.map(
                  (item) => OrderItemCreate(
                    productId: item.product.id,
                    quantity: item.quantity,
                  ),
                ),
              ),
              state.selectedAddress!.id!);
          res.when(
            onError: (error) => emit(
              state.copyWith(
                message: InfoMessage.fromError(error),
                status: ServiceStatus.submissionFailure,
              ),
            ),
            onSuccess: (_) => emit(
              state.copyWith(
                status: ServiceStatus.submissionSuccess,
                message: const InfoMessage(
                  message: "Your order has been created",
                  type: MessageType.success,
                ),
              ),
            ),
          );
        } else {
          emit(
            state.copyWith(
              message: const InfoMessage(
                message: "Please select shipping address!",
                type: MessageType.error,
              ),
            ),
          );
        }
      },
    );
  }
}
