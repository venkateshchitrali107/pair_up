abstract class ThemeRepository {
  const ThemeRepository();
  Future<bool> getIsDarkMode();
  Future<void> saveIsDarkMode(bool isDark);
}
