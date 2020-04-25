import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'recommendation_event.dart';
part 'recommendation_state.dart';

class RecommendationBloc extends Bloc<RecommendationEvent, RecommendationState> {
  @override
  RecommendationState get initialState => RecommendationInitial();

  @override
  Stream<RecommendationState> mapEventToState(
    RecommendationEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
