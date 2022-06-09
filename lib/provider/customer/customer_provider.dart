import 'package:flutter/cupertino.dart';
import 'package:mefood/generated/l10n.dart';
import 'package:mefood/model/customer/customer.dart';
import 'package:mefood/service/service.dart';

class CustomerProvider extends ChangeNotifier {
  CustomerModel? customer;

  CustomerProvider() {
    customer = CustomerModel();
  }

  Future<String?> login(
    BuildContext context, {
    required String email,
    required String pass,
  }) async {
    if (email.isEmpty || pass.isEmpty) {
      return 'Please fill email and password.';
    }
    var resp = await APIService.of(context).post(
      '${APIService.kUrlCustomerAuth}/login',
      {},
      checkToken: false,
    );
    if (resp != null) {
      if (resp['ret'] == 10000) {
      } else {
        return resp['msg'];
      }
    } else {
      return S.current.sever_error;
    }
  }
}
