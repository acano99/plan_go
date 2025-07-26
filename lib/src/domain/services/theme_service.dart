enum SelectedTheme { automatic, dark, light }

abstract class ThemeService {
  Future<SelectedTheme> getTheme();

  Future<void> setTheme(SelectedTheme theme);
}
