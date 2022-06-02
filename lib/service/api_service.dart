import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:mefood/service/service.dart';
import 'package:mefood/util/logger.dart';

// const kDomain = 'http://192.168.0.253:52526';
const kDomain = 'http://51.68.185.254:41515';

const kUrlAvatar = '$kDomain/assets/avatar/';
const kUrlIDCard = '$kDomain/assets/idcard/';
const kUrlDriver = '$kDomain/assets/drivercard/';
const kUrlPlate = '$kDomain/assets/plate/';
const kUrlCar = '$kDomain/assets/car/';

class APIService {
  final BuildContext? context;

  static final kUrlCategory = '$kDomain/api/category';
  static final kUrlAuth = '$kDomain/api/auth';
  static final kUrlSupport = '$kDomain/api/support';
  static final kUrlHistory = '$kDomain/api/history';

  APIService({this.context});

  factory APIService.of({BuildContext? context}) {
    return APIService(context: context);
  }

  Future<Map<String, dynamic>?> post(
    String link,
    Map<String, dynamic>? param,
  ) async {
    try {
      var url = Uri.parse(link);

      var body = <String, String>{};
      for (var key in param!.keys) {
        body[key] = param[key].toString();
      }

      if (context != null) {
        DialogService.of(context!).showProgressLoading();
      }
      final response = await http.post(
        url,
        body: body,
      );
      if (context != null) {
        Navigator.of(context!).pop();
      }

      if (response.statusCode == 201 || response.statusCode == 200) {
        try {
          var json = jsonDecode(response.body);
          logger.d(json.toString());
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
    } catch (e) {
      if (context != null) {
        Navigator.of(context!).pop();
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
      link = link + '?';
      for (var key in param.keys) {
        var value = param[key].toString();
        link = link + '$key=$value&';
      }
      link = link.substring(0, link.length - 1);
    }

    var url = Uri.parse(getUrl);
    final response = await http.get(
      url,
    );
    if (response.statusCode == 201 || response.statusCode == 200) {
      try {
        var json = jsonDecode(response.body);
        logger.d(json.toString());
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
    required String filePath,
  }) async {
    var url = Uri.parse('$kDomain/api/$path');
    var request = http.MultipartRequest("POST", url);
    request.files.add(await http.MultipartFile.fromPath('file', filePath));
    var response = await request.send();
    var responseData = await response.stream.toBytes();
    var responseString = String.fromCharCodes(responseData);
    return json.decode(responseString);
  }
}
