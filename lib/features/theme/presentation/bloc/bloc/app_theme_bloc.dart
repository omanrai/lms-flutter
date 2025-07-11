import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:lms/core/themes/app_theme.dart';

part 'app_theme_event.dart';
part 'app_theme_state.dart';

class AppThemeBloc extends Bloc<AppThemeEvent, AppThemeState> {
  AppThemeBloc() : super(AppThemeInitial(AppTheme.lightTheme)) {
    on<AppThemeEvent>((event, emit) {});
    on<AppThemeChanged>(_onAppThemChange);
  }

  void _onAppThemChange(AppThemeChanged event, Emitter<AppThemeState> emit) {
    emit(AppThemeInitial(event.theme));
  }
}
