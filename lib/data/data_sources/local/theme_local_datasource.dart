import '../../core/local_storage/local_storage.dart';
import '../../core/local_storage/local_storage_constants.dart';

abstract class ThemeLocalDatasource {
  const ThemeLocalDatasource();

  Future<bool?> getIsDarkMode();

  Future<void> saveIsDarkMode(bool isDark);
}

class ThemeLocalDatasourceImpl implements ThemeLocalDatasource {
  ThemeLocalDatasourceImpl({required this.localStorage});

  final LocalStorage localStorage;

  @override
  Future<bool?> getIsDarkMode() async {
    return localStorage.getBool(LocalStorageConstants.isDarkMode);
  }

  @override
  Future<void> saveIsDarkMode(bool isDark) async {
    await localStorage.saveBool(LocalStorageConstants.isDarkMode, isDark);
  }
}
