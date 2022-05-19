import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mefood/util/logger.dart';

const kDomain = 'http://192.168.0.253:52526';

class APIService {
  static final kUrlCategory = '$kDomain/category';

  APIService();

  factory APIService.of() {
    return APIService();
  }

  Future<Map<String, dynamic>?> post(
    String link,
    dynamic param,
  ) async {
    var url = Uri.parse(link);
    logger.d(json.encode(param));

    final response = await http.post(
      url,
      body: param,
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
}
