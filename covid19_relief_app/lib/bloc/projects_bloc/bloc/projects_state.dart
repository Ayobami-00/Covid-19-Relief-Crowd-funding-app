part of 'projects_bloc.dart';

abstract class ProjectsState extends Equatable {
  const ProjectsState();
}

class ProjectsInitial extends ProjectsState {
  @override
  List<Object> get props => [];
}
