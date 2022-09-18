import 'dart:async';

import 'package:market/data/models/address/address.dart';
import 'package:market/data/models/http/http.dart';
import 'package:market/data/models/user/user.dart';
import 'package:market/data/services/rest/client.dart';
import 'package:market/data/services/service.dart';
import 'package:market/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum AuthenticationStatus { unkown, authenticated, unauthenticated }

class AppRepository {
  AppRepository._();
  static AppRepository instance = AppRepository._();
  final _controller = StreamController<AuthenticationStatus>.broadcast();

  AuthenticationStatus _status = AuthenticationStatus.unkown;
  String? authToken;
  User? _user;
  User? get user => _user;
  List<Address> addresses = [];

  Stream<AuthenticationStatus> get stream async* {
    yield _status;
    yield* _controller.stream.asBroadcastStream();
  }

  AuthenticationStatus get status => _status;

  Future<void> login(String authToken) async {
    this.authToken = authToken;
    _status = AuthenticationStatus.authenticated;
    _controller.add(_status);
    await getUser();
  }

  void logout() async {
    await SharedPreferences.getInstance().then((value) => value.clear());
    _status = AuthenticationStatus.unauthenticated;
    _controller.add(_status);
  }

  void deleteAccount() {
    _status = AuthenticationStatus.unauthenticated;
    _controller.add(_status);
  }

  Future<HttpResult> updateUser(User data) {
    final res = service<UserAccount>().update(data.toJson()).then((result) {
      result.when(
        onError: (error) => {},
        onSuccess: (_) {
          _user = data;
          storeUserData(data);
        },
      );
      return result;
    });
    return res;
  }

  Future<HttpResult<User>> getUser() async {
    if (_user != null) {
      return HttpResult.onSuccess(data: _user!);
    }
    final localUserData = await getUserData();
    if (localUserData != null) {
      _user = localUserData;
      return HttpResult.onSuccess(data: localUserData);
    }
    final res = await service<UserAccount>().profile();
    res.when(onError: (error) {}, onSuccess: (user) => _user = user);
    return res;
  }

  Future<HttpResult<List<Address>>> getAddresses() async {
    if (addresses.isNotEmpty) {
      return HttpResult.onSuccess(data: addresses);
    }
    final res = await service<AddressService>().all();
    res.when(onError: (error) {}, onSuccess: (data) => addresses = data);
    return res;
  }

  addressUpdate(Address address, String id) {}

  Future<HttpResult<Address>> addressCreate(Address address) async {
    final res = await service<AddressService>().create(address);
    res.when(onError: (error) {}, onSuccess: (data) => addresses.add(data));
    return res;
  }

  Future<HttpResult<Address>> addressDelete(Address address) async {
    final res = await service<AddressService>().delete(address.id!);
    res.when(
      onError: (error) {},
      onSuccess: (data) => addresses =
          addresses.where((address) => address.id != data.id).toList(),
    );
    return res;
  }
}
