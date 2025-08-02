import '../../domain/repositories/theme_repository.dart';
import '../data_sources/local/theme_local_datasource.dart';

class ThemeRepositoryImpl extends ThemeRepository {
  final ThemeLocalDatasource themeLocalDatasource;

  ThemeRepositoryImpl({required this.themeLocalDatasource});

  @override
  Future<bool> getIsDarkMode() async {
    final isDarkMode = await themeLocalDatasource.getIsDarkMode();
    return isDarkMode ?? false;
  }

  @override
  Future<void> saveIsDarkMode(bool isDark) {
    return themeLocalDatasource.saveIsDarkMode(isDark);
  }
}
