import 'package:bloc/bloc.dart';

import '../../../../domain/use_cases/theme_use_case.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit({required this.themeUseCase})
    : super(const ThemeState(isDarkMode: false)) {
    _initTheme();
  }

  final ThemeUseCase themeUseCase;

  Future<void> _initTheme() async {
    final isDarkMode = await themeUseCase.getIsDarkMode();
    emit(state.copyWith(isDarkMode: isDarkMode));
  }

  Future<void> toggleTheme() async {
    final newThemeMode = !state.isDarkMode;
    await themeUseCase.saveIsDarkMode(newThemeMode);
    emit(state.copyWith(isDarkMode: newThemeMode));
  }
}
