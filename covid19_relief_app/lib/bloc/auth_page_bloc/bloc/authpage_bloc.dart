import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:covid19_relief_app/bloc/authentication_bloc/bloc/authentication_bloc.dart';
import 'package:covid19_relief_app/models/user_local_database_model.dart';
import 'package:covid19_relief_app/models/user_model.dart';
import 'package:covid19_relief_app/repository/api_repository.dart';
import 'package:covid19_relief_app/repository/user_local_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'authpage_event.dart';
part 'authpage_state.dart';

class AuthpageBloc extends Bloc<AuthpageEvent, AuthpageState> {
  final UserRepository userRepository;
  final AuthenticationBloc authenticationBloc;
  final ApiRepository apiRepository;

  AuthpageBloc(
      this.userRepository, this.authenticationBloc, this.apiRepository);

  @override
  AuthpageState get initialState => AuthpageInitial();

  @override
  Stream<AuthpageState> mapEventToState(
    AuthpageEvent event,
  ) async* {
    if (event is LoginButtonPressed) {
      yield AuthpageInitial();
      try {
        String token =
            await apiRepository.signInUser(body: event.userDetails.toJson());
        User user = User(
          id: 0,
          username: " ",
          token: token,
        );
        authenticationBloc.add(LoggedIn(user: user));
        yield AuthpageInitial();
      } catch (error) {
        yield LoginFaliure(error.toString());
      }
      yield LoginSuccessful();
    } else if (event is SignUpButtonPressed) {
      yield AuthpageLoading();

      try {
        await apiRepository.signUpUser(body: event.userDetails.toJson());
        String token =
            await apiRepository.signInUser(body: event.userDetails.toJson());
        User user = User(
          id: 0,
          username: event.userDetails.toJson()['full_name'],
          token: token,
        );
        authenticationBloc.add(LoggedIn(user: user));
        yield AuthpageLoading();
      } catch (error) {
        yield SignUpFaliure(error.toString());
      }
      yield SignUpSuccessful();
    }
  }
}






