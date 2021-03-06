import 'dart:convert';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:mefood/service/service.dart';
import 'package:mefood/util/logger.dart';

const kDomain =
    kDebugMode ? 'http://192.168.0.253:52526' : 'http://51.68.185.254:41515';
// const kDomain = 'http://51.68.185.254:41515';

const kUrlAvatar = '/assets/avatar/';
const kUrlIDCard = '/assets/idcard/';
const kUrlDriver = '/assets/drivercard/';
const kUrlPlate = '/assets/plate/';
const kUrlCar = '/assets/car/';
const kUrlLogo = '/assets/logo/';
const kUrlGallery = '/assets/gallery/';
const kUrlCategory = '/assets/category/';

class APIService {
  final BuildContext? context;

  static final kUrlSupport = '$kDomain/api/v1/support';
  static final kUrlHistory = '$kDomain/api/v1/history';
  static final kUrlMail = '$kDomain/api/v1/mail';
  static final kUrlUpload = '$kDomain/api/v1/upload';
  static final kUrlUser = '$kDomain/api/v1/user';
  static final kUrlCategory = '$kDomain/api/v1/category';
  static final kUrlProduct = '$kDomain/api/v1/product';
  static final kUrlOrder = '$kDomain/api/v1/order';
  static final kUrlAddress = '$kDomain/api/v1/address';
  static final kUrlSale = '$kDomain/api/v1/sale';

  static final kUrlDelivery = '$kDomain/api/v1/delivery';
  static final kUrlDeliveryAuth = '$kDomain/api/v1/delivery/auth';

  static final kUrlCustomer = '$kDomain/api/v1/customer';
  static final kUrlCustomerAuth = '$kDomain/api/v1/customer/auth';
  static final kUrlCustomerHome = '$kDomain/api/v1/customer/home';

  static final kUrlRestaurant = '$kDomain/api/v1/restaurant';
  static final kUrlRestaurantAuth = '$kDomain/api/v1/restaurant/auth';
  static final kUrlRestaurantProduct = '$kDomain/api/v1/restaurant/product';

  APIService({this.context});

  factory APIService.of(BuildContext? context) {
    return APIService(context: context);
  }

  Future<Map<String, dynamic>?> post(
    String link,
    Map<String, dynamic>? param, {
    bool checkToken = true,
  }) async {
    try {
      var url = Uri.parse(link);

      var body = <String, String>{};
      for (var key in param!.keys) {
        body[key] = param[key].toString();
      }

      if (context != null) {
        DialogService.of(context!).showProgressLoading();
      }

      var token = await PrefService.of().token();
      // if (kDebugMode) {
      //   token = '6b47427cead1999fc7115984192c539b';
      // }
      if (checkToken && token == null) {
        return {
          'msg': 'Expired Token!',
          'ret': 9996,
          'result': 'Expired Token',
        };
      }
      logger.d(url);

      final response = await http.post(
        url,
        headers: {
          'authorization': token ?? 'token',
        },
        body: body,
      );
      if (context != null) {
        Navigator.of(context!).pop();
      }

      if (response.statusCode == 201 || response.statusCode == 200) {
        try {
          var json = jsonDecode(response.body);
          logger.d(json.toString());
          try {
            var token = json['result']['token'];
            await PrefService.of().saveToken(token);
          } catch (e) {
            logger.w('Not existed token on callback');
          }
          return json;
        } catch (e) {
          logger.e(e);
          return null;
        }
      } else {
        logger.e(response.statusCode);
        if (context != null) {
          Navigator.popUntil(context!, (route) => route.isFirst);
        }
        return {
          'msg': 'Network Error! - Status Code ${response.statusCode}',
          'ret': 9998,
          'result': response.statusCode,
        };
      }
    } catch (e) {
      if (context != null) {
        Navigator.popUntil(context!, (route) => route.isFirst);
      }
      logger.e(e);
      return {
        'msg': 'Network Error! - $e',
        'ret': 9997,
        'result': e.toString(),
      };
    }
  }

  Future<Map<String, dynamic>?> get(
    String link,
    Map<String, dynamic>? param,
  ) async {
    var getUrl = link;

    if (param != null) {
      getUrl = getUrl + '?';
      for (var key in param.keys) {
        var value = param[key].toString();
        getUrl = getUrl + '$key=$value&';
      }
      getUrl = getUrl.substring(0, getUrl.length - 1);
    }

    var url = Uri.parse(getUrl);
    final response = await http.get(
      url,
    );
    if (response.statusCode == 201 || response.statusCode == 200) {
      try {
        var json = jsonDecode(response.body);
        return json;
      } catch (e) {
        logger.e(e);
        return null;
      }
    } else {
      logger.e(response.statusCode);
      return {
        'msg': 'Network Error! - Status Code ${response.statusCode}',
        'ret': 9998,
        'result': response.statusCode,
      };
    }
  }

  Future<dynamic> upload({
    required String path,
    String? filePath,
    PlatformFile? webFile,
  }) async {
    try {
      if (context != null) {
        DialogService.of(context!).showProgressLoading();
      }

      var url = Uri.parse('$kUrlUpload/$path');
      var request = http.MultipartRequest("POST", url);
      if (kIsWeb) {
        request.files.add(
          http.MultipartFile(
            'file',
            webFile!.readStream!,
            webFile.size,
            filename: webFile.name,
          ),
        );
      } else {
        request.files.add(await http.MultipartFile.fromPath('file', filePath!));
      }
      var response = await request.send();
      var responseString = await response.stream.bytesToString();

      if (context != null) {
        Navigator.of(context!).pop();
      }
      return json.decode(responseString);
    } catch (e) {
      if (context != null) {
        Navigator.of(context!).pop();
      }
      logger.e(e);
      return e;
    }
  }
}
