import 'package:get_it/get_it.dart';

import '../data/core/local_storage/local_storage.dart';
import '../data/data_sources/local/theme_local_datasource.dart';
import '../data/repositories_impl/theme_repository_impl.dart';
import '../domain/repositories/theme_repository.dart';
import '../domain/use_cases/theme_use_case.dart';
import '../presentation/themes/cubit/theme_cubit.dart';

final locator = GetIt.I;

class DependencyInjection {
  static Future<void> initializeInjection() async {
    locator
      ..registerLazySingleton<LocalStorage>(() => LocalStorage())
      ..registerLazySingleton<ThemeLocalDatasource>(
        () => ThemeLocalDatasourceImpl(localStorage: locator<LocalStorage>()),
      )
      ..registerLazySingleton<ThemeRepository>(
        () => ThemeRepositoryImpl(
          themeLocalDatasource: locator<ThemeLocalDatasource>(),
        ),
      )
      ..registerLazySingleton<ThemeUseCase>(
        () => ThemeUseCase(themeRepository: locator<ThemeRepository>()),
      )
      ..registerLazySingleton<ThemeCubit>(
        () => ThemeCubit(themeUseCase: locator<ThemeUseCase>()),
      );
  }
}
