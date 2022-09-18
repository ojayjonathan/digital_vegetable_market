import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:market/data/models/product/product.dart';
import 'package:market/data/repository/shopping.dart';
import 'package:market/data/services/rest/client.dart';
import 'package:market/data/services/service.dart';
import 'package:market/data/services/status.dart';
import 'package:market/resources/info.dart';

part 'state.dart';
part 'event.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ShoppingRepository _repository;
  ProductBloc(this._repository)
      : super(
          ProductState(
            productsPage: ProductsPage(pages: 0, products: [], currentPage: 0),
          ),
        ) {
    on<ProductStated>(
      (event, emit) async {
        emit(
          state.copyWith(status: ServiceStatus.loading),
        );
        final res = await _repository.productsPage();
        res.when(
            onError: (error) => emit(
                  state.copyWith(
                    message: InfoMessage.fromError(error),
                    status: ServiceStatus.loadingFailure,
                  ),
                ),
            onSuccess: (data) {
              emit(state.copyWith(
                products: data,
                status: ServiceStatus.loadingSuccess,
              ));
            });
      },
    );
    on<ProductSearched>(
      (event, emit) async {
        emit(
          state.copyWith(status: ServiceStatus.loading),
        );
        final res = await service<ProductService>().search(event.q);
        res.when(
          onError: (error) => emit(
            state.copyWith(
              message: InfoMessage.fromError(error),
              status: ServiceStatus.loadingFailure,
            ),
          ),
          onSuccess: (data) => emit(
            state.copyWith(
              products: data,
              status: ServiceStatus.loadingSuccess,
            ),
          ),
        );
      },
    );
  }
}
