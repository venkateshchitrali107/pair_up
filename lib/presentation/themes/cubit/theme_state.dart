part of 'theme_cubit.dart';

class ThemeState {
  const ThemeState({required this.isDarkMode});

  final bool isDarkMode;

  ThemeState copyWith({bool? isDarkMode}) {
    return ThemeState(isDarkMode: isDarkMode ?? this.isDarkMode);
  }
}
