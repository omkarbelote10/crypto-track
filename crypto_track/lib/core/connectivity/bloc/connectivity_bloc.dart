import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import 'connectivity_event.dart';
import 'connectivity_state.dart';

class ConnectivityBloc extends Bloc<ConnectivityEvent, ConnectivityState> {
  final Connectivity _connectivity;
  late final StreamSubscription _subscription;
  ConnectivityBloc(this._connectivity) : super(ConnectivityState.connected()) {
    on<ConnectivityChanged>(connectivityChanged);
    _subscription = _connectivity.onConnectivityChanged.listen((event) {
      final isConnected = !event.contains(ConnectivityResult.none);
      add(ConnectivityEvent.changed(isConnected: isConnected));
    },);
  }

  FutureOr<void> connectivityChanged(
    ConnectivityChanged event,
    Emitter<ConnectivityState> emit,
  ) {
    if(event.isConnected){
      emit(ConnectivityState.connected());
    }else{
      emit(ConnectivityState.disconnected());
    }
  }
  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }
}
