part of 'app_language_bloc.dart';

sealed class AppLanguageEvent extends Equatable {
  const AppLanguageEvent();

  @override
  List<Object> get props => [];
}

class AppLanguageChangedEvent extends AppLanguageEvent{
  final Locale appLanguage;
  const AppLanguageChangedEvent(this.appLanguage);
  @override
  List<Object> get props => [appLanguage];
}
