import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bloc_login_login_event.dart';
part 'bloc_login_login_state.dart';

class BlocLoginLoginBloc extends Bloc<BlocLoginLoginEvent, BlocLoginLoginState> {
  BlocLoginLoginBloc() : super(BlocLoginLoginInitial());

  @override
  Stream<BlocLoginLoginState> mapEventToState(
    BlocLoginLoginEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
