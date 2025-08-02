import '../repositories/theme_repository.dart';

class ThemeUseCase {
  final ThemeRepository themeRepository;

  ThemeUseCase({required this.themeRepository});

  Future<bool> getIsDarkMode() async {
    return themeRepository.getIsDarkMode();
  }

  Future<void> saveIsDarkMode(bool isDark) {
    return themeRepository.saveIsDarkMode(isDark);
  }
}
