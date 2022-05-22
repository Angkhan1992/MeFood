import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mefood/util/logger.dart';

const kDomain = 'http://192.168.0.253:52526';
const kUrlAvatar = '$kDomain/assets/avatar/';

class APIService {
  static final kUrlCategory = '$kDomain/category';
  static final kUrlAuth = '$kDomain/auth';

  APIService();

  factory APIService.of() {
    return APIService();
  }

  Future<Map<String, dynamic>?> post(
    String link,
    Map<String, dynamic>? param,
  ) async {
    var url = Uri.parse(link);

    var body = <String, String>{};
    for (var key in param!.keys) {
      body[key] = param[key].toString();
    }

    final response = await http.post(
      url,
      body: body,
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

  Future<dynamic> uploadAvatar({
    required String filePath,
  }) async {
    var url = Uri.parse('$kDomain/uploadAvatar');
    var request = http.MultipartRequest("POST", url);
    request.files.add(await http.MultipartFile.fromPath('file', filePath));
    var response = await request.send();
    var responseData = await response.stream.toBytes();
    var responseString = String.fromCharCodes(responseData);
    return json.decode(responseString);
  }
}
