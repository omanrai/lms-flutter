part of 'app_theme_bloc.dart';

sealed class AppThemeEvent extends Equatable {
  const AppThemeEvent();

  @override
  List<Object> get props => [];
}

class AppThemeChangedEvent extends AppThemeEvent {
  final ThemeMode theme;
  const AppThemeChangedEvent(this.theme);

  @override
  List<Object> get props => [theme];
}
