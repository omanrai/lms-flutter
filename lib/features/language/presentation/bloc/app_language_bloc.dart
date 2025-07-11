import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:lms/l10n/app_localizations.dart';

part 'app_language_event.dart';
part 'app_language_state.dart';

class AppLanguageBloc extends Bloc<AppLanguageEvent, AppLanguageState> {
  AppLanguageBloc()
    : super(AppLanguageInitialState(AppLocalizations.supportedLocales.first)) {
    on<AppLanguageEvent>((event, emit) {});

    on<AppLanguageChangedEvent>((event, emit) {
      emit(AppLanguageInitialState(event.appLanguage));
    });
  }
}
