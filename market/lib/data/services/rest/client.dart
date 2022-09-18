import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:market/data/error/error_format.dart';
import 'package:market/data/models/address/address.dart';
import 'package:market/data/models/http/http.dart';
import 'package:market/data/models/message_response.dart/message.dart';
import 'package:market/data/models/order/order.dart';
import 'package:market/data/models/product/product.dart';
import 'package:market/data/models/user/user.dart';
import 'package:market/data/repository/app.dart';

part "http_client.dart";
part "api_endpoints.dart";

class UserAccount {
  Result<User> update(Map data) => Http.put(
        ApiEndpoints.profile,
        data,
        deserializer: (data) => User.fromJson(data),
      );
  Result<MessageResponse> register(UserCreate data) => Http.post(
        ApiEndpoints.register,
        data.toJson(),
        deserializer: (data) => MessageResponse.fromJson(data),
      );
  Result<String> login({required String phone, required String password}) =>
      Http.post(
        ApiEndpoints.login,
        {"password": password, "phone_number": phone},
        deserializer: (data) => data["access_token"],
      );
  Result<User> profile({String id = ""}) => Http.get(
        "${ApiEndpoints.profile}$id",
        deserializer: (data) => User.fromJson(data),
      );
  Result<MessageResponse> passwordChange(
    String oldPassword,
    String newPassword,
  ) =>
      Http.post(
        ApiEndpoints.changePassword,
        {"old_password": oldPassword, "new_password": newPassword},
        deserializer: (data) => MessageResponse.fromJson(data),
      );

  Result<MessageResponse> passwordResetInit(String email) => Http.post(
        ApiEndpoints.resetPasswordInit,
        {"email": email},
        deserializer: (data) => MessageResponse.fromJson(data),
      );
  Result<MessageResponse> passwordResetComplete(
          String code, String newPassword) =>
      Http.post(
        ApiEndpoints.passwordResetComplete,
        {"reset_code": code, "new_password": newPassword},
        deserializer: (data) => MessageResponse.fromJson(data),
      );

  Result<MessageResponse> feedback(
          {required String subject, required String description}) =>
      Http.post(
        ApiEndpoints.feedback,
        {"subject": subject, "description": description},
        deserializer: (data) => MessageResponse.fromJson(data),
      );
}

class AddressService {
  Result<List<Address>> all() => Http.get(
        ApiEndpoints.address,
        deserializer: (data) => List<Address>.from(
          data.map((json) => Address.fromJson(json)),
        ),
      );
  Result<Address> one(int id) => Http.get(
        "${ApiEndpoints.address}$id",
        deserializer: (json) => Address.fromJson(json),
      );
  Result<Address> create(Address address) => Http.post(
        ApiEndpoints.address,
        address.toJson(),
        deserializer: (json) => Address.fromJson(json),
      );
  Result<Address> update(int id, Address address) => Http.post(
        "${ApiEndpoints.address}$id",
        address.toJson(),
        deserializer: (json) => Address.fromJson(json),
      );
  Result<Address> delete(int id) => Http.delete(
        "${ApiEndpoints.address}$id",
        deserializer: (json) => Address.fromJson(json),
      );
}

class OrderService {
  Result<List<Order>> all() => Http.get(
        ApiEndpoints.orders,
        deserializer: (data) => List<Order>.from(
          data.map((json) => Order.fromJson(json)),
        ),
      );
  Result<Order> one(int id) => Http.get(
        "${ApiEndpoints.orders}$id",
        deserializer: (json) => Order.fromJson(json),
      );
  Result<Order> create(List<OrderItemCreate> items, int addressId) => Http.post(
        ApiEndpoints.orders,
        {
          "delivery_address_id": addressId,
          "order_items": items.map((e) => e.toJson()).toList()
        },
        deserializer: (json) => Order.fromJson(json),
      );
  Result<Order> update(int id) => Http.post(
        "${ApiEndpoints.orders}$id",
        {"status": "CANCELLED"},
        deserializer: (json) => Order.fromJson(json),
      );
  Result<Order> delete(int id) => Http.delete(
        "${ApiEndpoints.orders}$id",
        deserializer: (json) => Order.fromJson(json),
      );
}

class ProductService {
  Result<List<Product>> productsMe() => Http.get(
        "${ApiEndpoints.products}me/",
        deserializer: (data) => List<Product>.from(
          data.map((json) => Product.fromJson(data)),
        ),
      );
  Result<ProductsPage> all({int? page, int? count, int? userId}) {
    final queryParams = {"page": page ?? 1};
    if (count != null) queryParams["count"] = count;
    if (userId != null) queryParams["user_id"] = userId;
    return Http.get(
      ApiEndpoints.products,
      queryParams: queryParams,
      deserializer: (data) => ProductsPage.fromJson(data),
    );
  }

  Result<ProductsPage> search(String q) {
    return Http.get(
      ApiEndpoints.products,
      queryParams: {"q": q},
      deserializer: (data) => ProductsPage.fromJson(data),
    );
  }

  Result<Product> one(int id) => Http.get(
        "${ApiEndpoints.products}$id",
        deserializer: (json) => Product.fromJson(json),
      );

  Result<Product> create(ProductCreate product, File image) async {
    final data = product.toJson();
    data["image"] = await MultipartFile.fromFile(
      image.path,
      filename: image.path.split("/").last,
    );

    FormData formData = FormData.fromMap(data);
    return Http.post(
      ApiEndpoints.products,
      formData,
      options: Options(
        headers: {"content-Type": "multipart/form-data"},
      ),
      deserializer: (json) => Product.fromJson(json),
    );
  }

  Result<Product> update(int id, {ProductUpdate? product, File? image}) async {
    final data = product?.toJson() ?? {};
    if (image != null) {
      data["image"] = await MultipartFile.fromFile(
        image.path,
        filename: image.path.split("/").last,
      );
    }
    FormData formData = FormData.fromMap(data);
    return Http.post(
      "${ApiEndpoints.products}$id",
      formData,
      options: Options(
        headers: {"content-Type": "multipart/form-data"},
      ),
      deserializer: (json) => Product.fromJson(json),
    );
  }

  Result<Product> delete(int id) => Http.delete(
        "${ApiEndpoints.products}$id",
        deserializer: (json) => Product.fromJson(json),
      );
}
