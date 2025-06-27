import 'package:plan_go/src/domain/services/theme_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeServicePreferences implements ThemeService {
  final SharedPreferences _preferences;

  ThemeServicePreferences({required SharedPreferences preferences})
    : _preferences = preferences;

  @override
  Future<SelectedTheme> getTheme() async {
    try {
      final response = _preferences.getString('theme');
      switch (response) {
        case 'dark':
          return SelectedTheme.dark;
        case 'light':
          return SelectedTheme.light;
        default:
          return SelectedTheme.automatic;
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> setTheme(SelectedTheme theme) async {
    try {
      await _preferences.setString(
        'theme',
        theme == SelectedTheme.dark
            ? 'dark'
            : theme == SelectedTheme.light
            ? 'light'
            : 'automatic',
      );
    } catch (e) {
      throw Exception(e);
    }
  }
}
