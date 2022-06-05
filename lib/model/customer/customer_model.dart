import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mefood/model/model.dart';

part 'customer_model.freezed.dart';
part 'customer_model.g.dart';

@unfreezed
class CustomerModel with _$CustomerModel {
  factory CustomerModel({
    int? id,
    AddressModel? address,
    String? regdate,
    String? updated,
    String? member,
    // extend fields
    MemberModel? user,
  }) = _CustomerModel;

  factory CustomerModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerModelFromJson(json);
}
