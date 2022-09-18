import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:market/data/models/address/address.dart';
import 'package:market/data/models/user/user.dart';
import 'package:market/data/repository/app.dart';
import 'package:market/data/services/status.dart';
import 'package:market/resources/info.dart';

part "state.dart";
part 'event.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  AppRepository repository;
  AccountBloc(this.repository) : super(const AccountState()) {
    on<AccountStarted>(_accountStated);
    on<AccountUpdated>(_updateProfile);
    on<AddressUpdate>(
      (event, emit) async {
        emit(
          state.copyWith(
            message: InfoMessage(
              message: "Updating ${event.address.title}, please wait...",
              type: MessageType.success,
            ),
          ),
        );
        final res = await repository.addressUpdate(event.address, event.id);
        res.when(
          onError: (error) => emit(
            state.copyWith(
              message: InfoMessage.fromError(error),
            ),
          ),
          onSuccess: (data) {
            emit(
              state.copyWith(
                message: InfoMessage(
                  message: "${data.title} updated successfuly ",
                  type: MessageType.success,
                ),
                home: _filter("HOME"),
                work: _filter("WORK"),
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
            message: InfoMessage(
              message: "Creating ${event.address.title}, please wait...",
              type: MessageType.success,
            ),
          ),
        );
        final res = await repository.addressCreate(event.address);
        res.when(
          onError: (error) => emit(
            state.copyWith(
              message: InfoMessage.fromError(error),
            ),
          ),
          onSuccess: (data) {
            emit(
              state.copyWith(
                message: InfoMessage(
                  message: "${data.title} created successfuly ",
                  type: MessageType.success,
                ),
                home: _filter("HOME"),
                work: _filter("WORK"),
              ),
            );
          },
        );
      },
    );
  }
  FutureOr<void> _accountStated(
      AccountEvent event, Emitter<AccountState> emit) async {
    emit(
      state.copyWith(
        profileStatus: ServiceStatus.loading,
        home: _filter("HOME"),
        work: _filter("WORK"),
      ),
    );
    final res = await repository.getUser();
    res.when(
      onError: (error) {
        emit(
          state.copyWith(
            profileStatus: ServiceStatus.loadingFailure,
            message: InfoMessage.fromError(error),
          ),
        );
      },
      onSuccess: (user) => emit(
        state.copyWith(
          user: user,
          profileStatus: ServiceStatus.loadingSuccess,
        ),
      ),
    );
  }

  FutureOr<void> _updateProfile(
      AccountUpdated event, Emitter<AccountState> emit) async {
    emit(
      state.copyWith(profileStatus: ServiceStatus.submissionInProgress),
    );
    final res = await repository.updateUser(event.user);
    res.when(
      onError: (error) {
        emit(
          state.copyWith(
            message: InfoMessage.fromError(error),
            profileStatus: ServiceStatus.submissionFailure,
          ),
        );
      },
      onSuccess: (_) {
        emit(
          state.copyWith(
            user: event.user,
            message: const InfoMessage(
              message: "Profile updated",
              type: MessageType.success,
            ),
            profileStatus: ServiceStatus.submissionSuccess,
          ),
        );
      },
    );
  }

  Address? _filter(String key) {
    for (var address in repository.addresses) {
      if (address.title?.toUpperCase() == key.toUpperCase()) {
        return address;
      }
    }
    return null;
  }

  void uploadProfileImage() {}
}
