import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:lms/core/themes/app_theme.dart';

part 'app_theme_event.dart';
part 'app_theme_state.dart';

class AppThemeBloc extends Bloc<AppThemeEvent, AppThemeState> {
  AppThemeBloc() : super(AppThemeInitial(ThemeMode.light)) {
    on<AppThemeEvent>((event, emit) {});
    on<AppThemeChangedEvent>(_onAppThemChange);
  }

  void _onAppThemChange(
    AppThemeChangedEvent event,
    Emitter<AppThemeState> emit,
  ) {
    emit(AppThemeInitial(event.theme));
  }
}
