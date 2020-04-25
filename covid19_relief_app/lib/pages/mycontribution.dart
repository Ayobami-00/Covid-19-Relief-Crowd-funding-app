import 'package:covid19_relief_app/bloc/mycontribution_bloc/bloc/mycontribution_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyContribution extends StatefulWidget {
  @override
  _MyContributionState createState() => _MyContributionState();
}

class _MyContributionState extends State<MyContribution> {
  @override
  Widget build(BuildContext context) {
    BlocListener<MycontributionBloc, MycontributionState>(
        listener: (context, state) {
      if (state is MycontributionInitial) {
        // Scaffold.of(context).showSnackBar(SnackBar(
        //   content: Text('${state.error}'),
        //   backgroundColor: Colors.red,
        // ));
      }
    }, child: BlocBuilder<MycontributionBloc, MycontributionState>(
            builder: (context, state) {
      if (state is MycontributionInitial) {
        return Container();
      }
    }));
  }
}