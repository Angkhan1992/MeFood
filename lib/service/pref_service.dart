import 'dart:convert';

import 'package:mefood/model/mail_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefService {
  PrefService();

  factory PrefService.of() {
    return PrefService();
  }

  Future<bool> isLanding() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('is_landing') ?? false;
  }

  Future<void> passLanding() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('is_landing', true);
  }

  Future<List<MailModel>> getMailHistory() async {
    final prefs = await SharedPreferences.getInstance();
    var jsonArray = jsonDecode(prefs.getString('history_mail') ?? '[]');
    return (jsonArray as List).map((e) => MailModel.fromJson(e)).toList();
  }

  Future<void> saveMailHistory(List<MailModel> models) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      'history_mail',
      jsonEncode(models.map((e) => e.toJson()).toList()),
    );
  }
}
