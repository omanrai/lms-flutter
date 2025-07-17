part of 'login_bloc.dart';

sealed class LoginState extends Equatable {
  const LoginState();
  
  @override
  List<Object> get props => [];
}

final class LoginInitial extends LoginState {}
final class LoggingInState extends LoginState {}
final class LoginFailedState extends LoginState {}
final class LoginSuccessState extends LoginState {}
