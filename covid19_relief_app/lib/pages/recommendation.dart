import 'package:covid19_relief_app/bloc/recommendation_bloc.dart/bloc/recommendation_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecommendationPage extends StatefulWidget {
  @override
  _RecommendationPageState createState() => _RecommendationPageState();
}

class _RecommendationPageState extends State<RecommendationPage> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<RecommendationBloc, RecommendationState>(
        listener: (context, state) {
      if (state is RecommendationInitial) {
        // Scaffold.of(context).showSnackBar(SnackBar(
        //   content: Text('${state.error}'),
        //   backgroundColor: Colors.red,
        // ));
      }
    }, child: BlocBuilder<RecommendationBloc, RecommendationState>(
            builder: (context, state) {
      if (state is RecommendationInitial) {
        return Container();
      }
    }));
  }
}
