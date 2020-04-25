import 'package:covid19_relief_app/bloc/projects_bloc/bloc/projects_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Projects extends StatefulWidget {
  @override
  _ProjectsState createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
  @override
  Widget build(BuildContext context) {
    BlocListener<ProjectsBloc, ProjectsState>(
        listener: (context, state) {
      if (state is ProjectsInitial) {
        // Scaffold.of(context).showSnackBar(SnackBar(
        //   content: Text('${state.error}'),
        //   backgroundColor: Colors.red,
        // ));
      }
    }, child: BlocBuilder<ProjectsBloc, ProjectsState>(
            builder: (context, state) {
      if (state is ProjectsInitial) {
        return Container();
      }
    }));
  }
}