part of 'app_theme_bloc.dart';

sealed class AppThemeState extends Equatable {
  const AppThemeState();

  @override
  List<Object> get props => [];
}

final class AppThemeInitial extends AppThemeState {
  final ThemeMode themeMode;

  const AppThemeInitial(this.themeMode);

  @override
  List<Object> get props => [themeMode];
}
