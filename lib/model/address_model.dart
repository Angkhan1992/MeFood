import 'package:freezed_annotation/freezed_annotation.dart';

part 'address_model.freezed.dart';
part 'address_model.g.dart';

@unfreezed
class AddressModel with _$AddressModel {
  factory AddressModel({
    @JsonKey(name: 'adr_id') int? id,
    @JsonKey(name: 'adr_address1') String? address1,
    @JsonKey(name: 'adr_address2') String? address2,
    @JsonKey(name: 'adr_city') String? city,
    @JsonKey(name: 'adr_postal') String? postal,
    @JsonKey(name: 'adr_province') String? province,
    @JsonKey(name: 'adr_country') String? country,
    @JsonKey(name: 'adr_lat') String? lat,
    @JsonKey(name: 'adr_lon') String? lon,
    @JsonKey(name: 'reg_date') String? regdate,
    String? other,
  }) = _AddressModel;
  factory AddressModel.fromJson(Map<String, dynamic> json) =>
      _$AddressModelFromJson(json);
}
