part of 'homepage_bloc.dart';

abstract class HomepageState extends Equatable {
  const HomepageState();
}

class HomepageLoading extends HomepageState {
  @override
  List<Object> get props => [];
}

class HomepageLoaded extends HomepageState {
  final UserProfileModel user_profile;

  HomepageLoaded(this.user_profile);
  @override
  List<Object> get props => [];
}