part of 'app_theme_bloc.dart';

sealed class AppThemeEvent extends Equatable {
  const AppThemeEvent();

  @override
  List<Object> get props => [];
}

class AppThemeChanged extends AppThemeEvent {
  final ThemeData theme;
  const AppThemeChanged(this.theme);

  @override
  List<Object> get props => [theme];
}