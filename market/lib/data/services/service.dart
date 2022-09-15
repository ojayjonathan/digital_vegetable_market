import 'package:get_it/get_it.dart';
import 'package:market/data/services/address.dart';
import 'package:market/data/services/rest/client.dart';

GetIt service = GetIt.asNewInstance();

setUpService() {
  service.registerLazySingleton<UserAccount>(() => UserAccount());
  service.registerLazySingleton<ProductService>(() => ProductService());
  service.registerLazySingleton<AddressService>(() => AddressService());
  service.registerLazySingleton<OrderService>(() => OrderService());
  service.registerLazySingleton<AddressProvider>(() => AddressProvider());
}
