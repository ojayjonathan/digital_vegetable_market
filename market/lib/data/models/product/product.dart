import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:market/data/models/address/address.dart';
import 'package:market/data/models/user/user.dart';
import 'package:market/data/services/rest/client.dart';

part 'product.g.dart';
part 'product.freezed.dart';

@Freezed(fromJson: true, copyWith: true)
class Product with _$Product {
  Product._();
  factory Product({
    required int id,
    @JsonKey(name: "image_url") required String image,
    String? description,
    required User owner,
    required String name,
    required Address address,
    @JsonKey(name: "expected_available_date") required DateTime availableDate,
    required double price,
    @JsonKey(name: "measurement_unit") required String measurementUnit,
  }) = _Product;
  
  String get imageUrl => MEDIA_URL + image;
  factory Product.fromJson(json) => _$$_ProductFromJson(json);
}

@Freezed(fromJson: true)
class ProductsPage with _$ProductsPage {
  factory ProductsPage({
    required int pages,
    required List<Product> products,
    @JsonKey(name: "current_page") required int currentPage,
  }) = _ProductsPage;
  factory ProductsPage.fromJson(json) => _$$_ProductsPageFromJson(json);
}

@Freezed(toJson: true)
class ProductCreate with _$ProductCreate {
  factory ProductCreate({
    @Default("") String description,
    @JsonKey(name: "owner_id") required String ownerId,
    @JsonKey(name: "expected_available_date") required DateTime availableDate,
    required double price,
    required String name,
    @JsonKey(name: "address_id") required int addressId,
    @JsonKey(name: "available_quantity") required double availableQuantity,
    @JsonKey(name: "measurement_unit") required String measurementUnit,
  }) = _ProductCreate;
}

@Freezed(toJson: true)
class ProductUpdate with _$ProductUpdate {
  factory ProductUpdate({
    String? description,
    @JsonKey(name: "expected_available_date") DateTime? availableDate,
    double? price,
    String? name,
    @JsonKey(name: "available_quantity") double? availableQuantity,
    @JsonKey(name: "measurement_unit") String? measurementUnit,
  }) = _ProductUpdate;
}
