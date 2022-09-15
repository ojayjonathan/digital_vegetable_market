import 'package:freezed_annotation/freezed_annotation.dart';
part "address.g.dart";
part "address.freezed.dart";

@freezed
class Address with _$Address {
  const Address._();
  factory Address({
    String? title,
    String? address,
    required double latitude,
    required double longitude,
    int? id,
  }) = _Address;
  String get name =>
      title ??
      address ??
      "Unnamed Address lat: ${latitude.toStringAsFixed(3)} lng: ${longitude.toStringAsFixed(3)} ";
  factory Address.fromJson(Map<String, Object?> json) =>
      _$AddressFromJson(json);
}
