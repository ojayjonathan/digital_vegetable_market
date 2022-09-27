// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Product _$$_ProductFromJson(Map<String, dynamic> json) => _$_Product(
      id: json['id'] as int,
      image: json['image_url'] as String,
      description: json['description'] as String?,
      owner: User.fromJson(json['owner']),
      name: json['name'] as String,
      address: Address.fromJson(json['address'] as Map<String, dynamic>),
      availableQuantity: (json['available_quantity'] as num).toDouble(),
      availableDate: DateTime.parse(json['expected_available_date'] as String),
      price: (json['price'] as num).toDouble(),
      measurementUnit: json['measurement_unit'] as String,
      category: json['category'] as String,
    );

Map<String, dynamic> _$$_ProductToJson(_$_Product instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image_url': instance.image,
      'description': instance.description,
      'owner': instance.owner,
      'name': instance.name,
      'address': instance.address,
      'available_quantity': instance.availableQuantity,
      'expected_available_date': instance.availableDate.toIso8601String(),
      'price': instance.price,
      'measurement_unit': instance.measurementUnit,
      'category': instance.category,
    };

_$_ProductsPage _$$_ProductsPageFromJson(Map<String, dynamic> json) =>
    _$_ProductsPage(
      pages: json['pages'] as int,
      products: (json['products'] as List<dynamic>)
          .map((e) => Product.fromJson(e))
          .toList(),
      currentPage: json['current_page'] as int,
    );

Map<String, dynamic> _$$_ProductsPageToJson(_$_ProductsPage instance) =>
    <String, dynamic>{
      'pages': instance.pages,
      'products': instance.products,
      'current_page': instance.currentPage,
    };

Map<String, dynamic> _$$_ProductCreateToJson(_$_ProductCreate instance) =>
    <String, dynamic>{
      'description': instance.description,
      'expected_available_date': instance.availableDate.toIso8601String(),
      'price': instance.price,
      'name': instance.name,
      'address_id': instance.addressId,
      'available_quantity': instance.availableQuantity,
      'measurement_unit': instance.measurementUnit,
      'category': instance.category,
    };

Map<String, dynamic> _$$_ProductUpdateToJson(_$_ProductUpdate instance) =>
    <String, dynamic>{
      'description': instance.description,
      'expected_available_date': instance.availableDate?.toIso8601String(),
      'price': instance.price,
      'name': instance.name,
      'available_quantity': instance.availableQuantity,
      'measurement_unit': instance.measurementUnit,
      'category': instance.category,
    };
