import 'package:flutter/cupertino.dart';
import 'package:mefood/extension/extension.dart';
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
      {
        'email': email,
        'password': pass.generateMD5,
        'type': 'CUSTOMER',
      },
      checkToken: false,
    );
    if (resp != null) {
      if (resp['ret'] == 10000) {
        customer = CustomerModel.fromJson(resp['result']['customer']);
        await PrefService.of().saveToken(resp['result']['token']);
        notifyListeners();
        return null;
      } else {
        return resp['msg'];
      }
    } else {
      return S.current.sever_error;
    }
  }

  Future<String?> loginToken() async {
    var resp = await APIService.of(null).post(
      '${APIService.kUrlCustomerAuth}/token',
      {},
    );
    if (resp != null) {
      if (resp['ret'] == 10000) {
        customer = CustomerModel.fromJson(resp['result']['customer']);
        await PrefService.of().saveToken(resp['result']['token']);
        notifyListeners();
        return null;
      } else {
        return resp['msg'];
      }
    } else {
      return S.current.sever_error;
    }
  }
}
