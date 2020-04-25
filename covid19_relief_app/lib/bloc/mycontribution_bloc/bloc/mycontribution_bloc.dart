import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'mycontribution_event.dart';
part 'mycontribution_state.dart';

class MycontributionBloc extends Bloc<MycontributionEvent, MycontributionState> {
  @override
  MycontributionState get initialState => MycontributionInitial();

  @override
  Stream<MycontributionState> mapEventToState(
    MycontributionEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
