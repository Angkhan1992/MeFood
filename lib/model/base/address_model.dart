import 'package:freezed_annotation/freezed_annotation.dart';

part 'address_model.freezed.dart';
part 'address_model.g.dart';

@unfreezed
class AddressModel with _$AddressModel {
  factory AddressModel({
    int? id,
    String? address1,
    String? address2,
    String? city,
    String? postal,
    String? province,
    String? country,
    String? lat,
    String? lon,
    String? regdate,
    String? updated,
  }) = _AddressModel;

  factory AddressModel.fromJson(Map<String, dynamic> json) =>
      _$AddressModelFromJson(json);
}
