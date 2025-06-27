import 'package:plan_go/src/domain/services/theme_service.dart';

class GetThemeUseCase {
  final ThemeService _service;

  GetThemeUseCase({required ThemeService service}) : _service = service;

  Future<SelectedTheme> invoke() async => await _service.getTheme();
}
