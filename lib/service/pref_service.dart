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
}
