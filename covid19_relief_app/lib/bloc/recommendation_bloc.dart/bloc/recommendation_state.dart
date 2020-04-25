part of 'recommendation_bloc.dart';

abstract class RecommendationState extends Equatable {
  const RecommendationState();
}

class RecommendationInitial extends RecommendationState {
  @override
  List<Object> get props => [];
}
