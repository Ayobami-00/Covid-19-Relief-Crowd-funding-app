part of 'authpage_bloc.dart';

abstract class AuthpageEvent extends Equatable {
  const AuthpageEvent();
}

class LoginButtonPressed extends AuthpageEvent {
  final UserLoginModel userDetails;

  LoginButtonPressed(this.userDetails);
  @override
  // TODO: implement props
  List<Object> get props => null;
}


class SignUpButtonPressed extends AuthpageEvent {
  final UserModel userDetails;

  SignUpButtonPressed(this.userDetails);
  @override
  // TODO: implement props
  List<Object> get props => null;
}