import 'package:covid19_relief_app/api/api_client.dart';
import 'package:covid19_relief_app/bloc/auth_page_bloc/bloc/authpage_bloc.dart';
import 'package:covid19_relief_app/bloc/authentication_bloc/bloc/authentication_bloc.dart';
import 'package:covid19_relief_app/pages/auth.dart';
import 'package:covid19_relief_app/pages/home.dart';
import 'package:covid19_relief_app/pages/splash.dart';
import 'package:covid19_relief_app/repository/api_repository.dart';
import 'package:covid19_relief_app/repository/user_local_repository.dart';
import 'package:covid19_relief_app/utils/colors.dart';
import 'package:covid19_relief_app/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/homepage_bloc/bloc/homepage_bloc.dart';

class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
    print(event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }

  @override
  void onError(Bloc bloc, Object error, StackTrace stacktrace) {
    super.onError(bloc, error, stacktrace);
  }
}

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  final userRepository = UserRepository();

  runApp(BlocProvider<AuthenticationBloc>(
    create: (context) {
      return AuthenticationBloc(userRepository: userRepository)
        ..add(AppStarted());
    },
    child: App(userRepository: userRepository),
  ));
}

class App extends StatelessWidget {
  final UserRepository userRepository;
  CustomColour _customColour = CustomColour();
  static final ApiRepository apiRepository =
      ApiRepository(apiClient: ApiClient());

  App({Key key, @required this.userRepository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: _customColour.color1,
      ),
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is AuthenticationUnintialized) {
            return SplashPage();
          }
          if (state is AuthenticationAuthenticated) {
            return BlocProvider(
              create: (context) => HomepageBloc(userRepository, apiRepository),
              child: HomePage(),
            );
          }
          if (state is AuthenticationUnauthenticated) {
            return BlocProvider(
              create: (context) => AuthpageBloc(userRepository,
                  BlocProvider.of<AuthenticationBloc>(context), apiRepository),
              child: AuthPage(),
            );
          }
          if (state is AuthenticationLoading) {
            return Loading();
          }
        },
      ),
    );
  }
}
