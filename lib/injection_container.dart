import 'package:get_it/get_it.dart';
import 'package:lms/core/api/dio_interceptor.dart';
import 'package:lms/features/language/presentation/bloc/app_language_bloc.dart';
import 'package:lms/features/login/presentation/bloc/login_bloc.dart';

import 'features/theme/presentation/bloc/bloc/app_theme_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // BLoCs
  sl.registerSingleton<AppLanguageBloc>(AppLanguageBloc());
  sl.registerSingleton<AppThemeBloc>(AppThemeBloc());
  sl.registerSingleton<ApiInterceptor>(ApiInterceptor());
  sl.registerSingleton(LoginBloc());
}
