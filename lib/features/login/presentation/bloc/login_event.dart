part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}


class LoginSubmittedEvent extends LoginEvent{
  final String email;
  final String password;
  const LoginSubmittedEvent(this.email, this.password);
}

