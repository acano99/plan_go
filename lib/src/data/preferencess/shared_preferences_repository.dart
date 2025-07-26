import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesRepository {
  static final SharedPreferencesRepository _instance =
      SharedPreferencesRepository._internal();
  factory SharedPreferencesRepository() => _instance;
  SharedPreferencesRepository._internal();

  static SharedPreferences? _prefs;

  Future<SharedPreferences> get preferences async {
    _prefs ??= await SharedPreferences.getInstance();
    return _prefs!;
  }
}
