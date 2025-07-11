part of 'app_language_bloc.dart';

sealed class AppLanguageState extends Equatable {
  const AppLanguageState();

  @override
  List<Object> get props => [];
}

final class AppLanguageInitialState extends AppLanguageState {
  final Locale locale;
  const AppLanguageInitialState(this.locale);

  @override
  List<Object> get props => [locale];
}
