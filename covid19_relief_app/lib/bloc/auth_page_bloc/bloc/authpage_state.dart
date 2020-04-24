part of 'authpage_bloc.dart';

abstract class AuthpageState extends Equatable {
  const AuthpageState();
}

class AuthpageInitial extends AuthpageState {
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class AuthpageLoading extends AuthpageState {
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class LoginFaliure extends AuthpageState {
  final String error;

  LoginFaliure(this.error);

  @override
  List<Object> get props => [error];

  @override
  String toString() => ' LoginFaliure { error: $error }';
}

class SignUpFaliure extends AuthpageState {
  final String error;

  SignUpFaliure(this.error);

  @override
  List<Object> get props => [error];

  @override
  String toString() => ' LoginFaliure { error: $error }';
}

class SignUpSuccessful extends AuthpageState {
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class LoginSuccessful extends AuthpageState {
  @override
  // TODO: implement props
  List<Object> get props => null;
}