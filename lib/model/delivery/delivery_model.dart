import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mefood/model/model.dart';

part 'delivery_model.freezed.dart';
part 'delivery_model.g.dart';

@unfreezed
class DeliveryModel with _$DeliveryModel {
  factory DeliveryModel({
    int? id,
    String? member,
    String? regdate,
    String? updated,
    // extend fields
    AddressModel? address,
    CarModel? car,
    MemberModel? user,
  }) = _DeliveryModel;

  factory DeliveryModel.fromJson(Map<String, dynamic> json) =>
      _$DeliveryModelFromJson(json);
}
