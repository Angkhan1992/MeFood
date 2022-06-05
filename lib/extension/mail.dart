import 'package:mefood/model/model.dart';
import 'package:mefood/service/api_service.dart';
import 'package:mefood/service/service.dart';

class ExtMail {
  MailModel model;
  bool isSelected;

  ExtMail(
    this.model, {
    this.isSelected = false,
  });

  factory ExtMail.instanceOf(MailModel model) {
    return ExtMail(model);
  }

  Future<String?> updateMail(String status) async {
    var resp = await APIService.of().post(
      '${APIService.kUrlHistory}/updateMail',
      {
        'id': model.id!,
        'status': status,
      },
    );
    if (resp!['ret'] == 10000) {
      return null;
    } else {
      return resp['msg'];
    }
  }
}
