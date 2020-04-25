import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:covid19_relief_app/models/user_model.dart';
import 'package:covid19_relief_app/repository/api_repository.dart';
import 'package:covid19_relief_app/repository/user_local_repository.dart';
import 'package:equatable/equatable.dart';

part 'homepage_event.dart';
part 'homepage_state.dart';

class HomepageBloc extends Bloc<HomepageEvent, HomepageState> {
  final UserRepository userRepository;
  final ApiRepository apiRepository;

  HomepageBloc(this.userRepository, this.apiRepository);

  

  @override
  HomepageState get initialState => HomepageLoading();
  

  @override
  Stream<HomepageState> mapEventToState(
    HomepageEvent event,
  ) async* {
    if(event is LoadHomePage){
      
      final List<Map> users = await userRepository.getUser();
      print(users[0]['token']);
      UserProfileModel user_profile = await apiRepository.fetchUserProfile(users[0]['token'].toString());
      print(user_profile.toJson());
      yield HomepageLoaded(user_profile);

    }
  }
}
