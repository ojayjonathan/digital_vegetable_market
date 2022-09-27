import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:market/data/domain/form_input.dart';
import 'package:market/data/models/address/address.dart';
import 'package:market/data/models/product/product.dart';
import 'package:market/data/services/rest/client.dart';
import 'package:market/data/services/service.dart';
import 'package:market/data/services/status.dart';
import 'package:market/resources/info.dart';

part "state.dart";

class UserProductsCubit extends Cubit<UserProductsState> {
  UserProductsCubit() : super(const UserProductsListState());
  productListStarted() async {
    emit(
      const UserProductsListState(
        status: ServiceStatus.loading,
      ),
    );
    final res = await service<ProductService>().productsMe();
    res.when(
      onError: (error) => emit(
        UserProductsListState(
          status: ServiceStatus.loadingFailure,
          message: InfoMessage.fromError(error),
        ),
      ),
      onSuccess: (data) {
        emit(UserProductsListState(
          status: ServiceStatus.loadingSuccess,
          products: data,
        ));
      },
    );
  }

  updateStarted(Product product) {
    emit(
      UserProductsUpdateState(
        category: RequiredInput.pure(value: product.category),
        selectedProductId: product.id,
        availableDate: RequiredInput.pure(value: product.availableDate),
        availableQuantity: RequiredInput.pure(value: product.availableQuantity),
        description: RequiredInput.pure(value: product.description),
        measurementUnit: TextInput.pure(product.measurementUnit),
        name: RequiredInput.pure(value: product.name),
        price: RequiredInput.pure(value: product.price),
        address: RequiredInput.pure(value: product.address),
      ),
    );
  }

  createStarted() {
    emit(const UserProductsCreate());
  }

  dateChanged(DateTime date) {
    emit(
      state.copyWith(
        availableDate: RequiredInput.dirty(value: date),
      ),
    );
  }

  quantityChanged(double? value) {
    emit(
      state.copyWith(
        availableQuantity: RequiredInput.dirty(value: value),
      ),
    );
  }

  priceChanged(double? value) {
    emit(
      state.copyWith(
        price: RequiredInput.dirty(value: value),
      ),
    );
  }

  descriptionChanged(String value) {
    emit(
      state.copyWith(
        description: RequiredInput.dirty(value: value),
      ),
    );
  }

  nameChanged(String value) {
    emit(
      state.copyWith(
        name: RequiredInput.dirty(value: value),
      ),
    );
  }

  measurementUnitChanged(String value) {
    emit(
      state.copyWith(
        measurementUnit: TextInput.dirty(value),
      ),
    );
  }

  unitChanged(String value) {
    emit(
      state.copyWith(
        measurementUnit: TextInput.dirty(value),
      ),
    );
  }

  imageChanged(File file) async {
    if (state.image is OptionalInput) {
      emit(
        state.copyWith(
          image: OptionalInput.dirty(value: file),
        ),
      );
    } else {
      emit(
        state.copyWith(
          image: RequiredInput.dirty(value: file),
        ),
      );
    }
  }

  addressChanged(Address value) {
    emit(
      state.copyWith(
        address: RequiredInput.dirty(value: value),
      ),
    );
  }

  categoryChanged(String? value) {
    if (value != null) return;
    emit(
      state.copyWith(
        category: RequiredInput.dirty(value: value),
      ),
    );
  }

  submit() async {
    if (state.validate) {
      emit(
        state.copyWith(status: ServiceStatus.submissionInProgress),
      );
      if (state.selectedProductId != null) {
        await updateProduct(state);
      } else {
        await createProduct(state);
      }
    } else {
      emit(
        state.copyWith(
          status: ServiceStatus.submissionFailure,
          message: state.image?.error == null
              ? null
              : const InfoMessage(
                  message: "Product image is required",
                  type: MessageType.error,
                ),
        ),
      );
    }
  }

  createProduct(UserProductsState state) async {
    final res = await service<ProductService>().create(
      ProductCreate(
          category: state.category?.value ?? "VEGETABLES",
          availableDate: state.availableDate!.value!,
          price: state.price!.value!,
          name: state.name!.value!,
          addressId: state.address!.value!.id!,
          availableQuantity: state.availableQuantity!.value!,
          measurementUnit: state.measurementUnit!.value,
          description: state.description!.value!),
      state.image!.value!,
    );
    res.when(
      onError: (error) => emit(
        state.copyWith(
          message: InfoMessage.fromError(error),
          status: ServiceStatus.submissionFailure,
        ),
      ),
      onSuccess: (data) => emit(
        state.copyWith(
            message: const InfoMessage(
              message: "Product Created successfuly",
              type: MessageType.success,
            ),
            status: ServiceStatus.loadingSuccess),
      ),
    );
  }

  updateProduct(UserProductsState state) async {
    final res = await service<ProductService>().update(
      state.selectedProductId!,
      product: ProductUpdate(
        category: state.category?.value ?? "VEGETABLES",
        description: state.description!.value,
        availableDate: state.availableDate!.value!,
        price: state.price!.value!,
        name: state.name!.value!,
        availableQuantity: state.availableQuantity!.value!,
        measurementUnit: state.measurementUnit!.value,
      ),
      image: state.image!.value,
    );
    res.when(
      onError: (error) => emit(
        state.copyWith(
          message: InfoMessage.fromError(error),
          status: ServiceStatus.submissionFailure,
        ),
      ),
      onSuccess: (data) => emit(
        state.copyWith(
          message: const InfoMessage(
            message: "Product Updated successfuly",
            type: MessageType.success,
          ),
          status: ServiceStatus.loadingSuccess,
        ),
      ),
    );
  }
}
