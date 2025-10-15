import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


part 'connectivity_event.dart';
part 'connectivity_state.dart';


class ConnectivityBloc extends Bloc<ConnectivityEvent, ConnectivityState> {
  final Connectivity _connectivity = Connectivity();
  StreamSubscription? _subscription;

  ConnectivityBloc(EmptyConnectivityState initialState) : super(initialState) {
    on<ConnectivityEvent>(_handleCheckConnectivity);
  }

  FutureOr<void> _handleCheckConnectivity(ConnectivityEvent event, Emitter<ConnectivityState> emit) async {
    final ConnectivityState currentState = state;
    final connectivityResult = await _connectivity.checkConnectivity();

    // if(event is CheckConnectivityEvent){
    //   // emit(result != ConnectivityResult.none ?  InternetConnected(currentState.attempt + 1) : InternetConnected(currentState.attempt + 1));
    // }

    // if(event is CheckConnectivityEvent){
    //
    //   if (connectivityResult != ConnectivityResult.none) {
    //     if (connectivityResult == ConnectivityResult.wifi) {
    //       emit(ConnectivityOnline(ConnectionType.Wifi, currentState.attempt + 1));
    //     } else if (connectivityResult == ConnectivityResult.mobile) {
    //       emit(ConnectivityOnline(ConnectionType.Mobile, currentState.attempt + 1));
    //     }
    //
    //   } else if (connectivityResult == ConnectivityResult.none) {
    //     emit(ConnectivityOffline("No Internet Connection", currentState.attempt + 1));
    //   }
    //
    //
    //   // _subscription = _connectivity.onConnectivityChanged.listen((connectivityResult) {
    //   //   if (connectivityResult == ConnectivityResult.wifi) {
    //   //     emit(ConnectivityOnline(ConnectionType.Wifi, currentState.attempt + 1));
    //   //   } else if (connectivityResult == ConnectivityResult.mobile) {
    //   //     emit(ConnectivityOnline(ConnectionType.Mobile, currentState.attempt + 1));
    //   //   } else if (connectivityResult == ConnectivityResult.none) {
    //   //     ConnectivityOffline("No Internet Connection", currentState.attempt + 1);
    //   //   }
    //   // });
    // }

  }

  // FutureOr<void> _onConnectivityChanged(ConnectivityEvent event, Emitter<ConnectivityState> emit) async {
  //   final ConnectivityState currentState = state;
  //   if(event is CheckConnectivityEvent){
  //
  //   }
  //
  // }


  // ConnectivityBloc() : super(ConnectivityInitial()) {
  //   on<CheckConnectivity>(_onCheckConnectivity);
  //   on<ConnectivityChanged>(_onConnectivityChanged);
  //
  //   _subscription = _connectivity.onConnectivityChanged.listen((connectivityResult) {
  //     if (connectivityResult == ConnectivityResult.wifi) {
  //       emitInternetConnected(ConnectionType.Wifi);
  //     } else if (connectivityResult == ConnectivityResult.mobile) {
  //       emitInternetConnected(ConnectionType.Mobile);
  //     } else if (connectivityResult == ConnectivityResult.none) {
  //       emitInternetDisconnected();
  //     }
  //     // add(ConnectivityChanged(result != ConnectivityResult.none));
  //   });
  // }



  // void emitInternetConnected(ConnectionType connectionType) =>
  //     emit(ConnectivityOnline(connectionType: connectionType));
  //
  // void emitInternetDisconnected() => emit(ConnectivityOffline());
  //
  // Future<void> _onCheckConnectivity(
  //     CheckConnectivity event,
  //     Emitter<ConnectivityState> emit,
  //     ) async {
  //
  // }
  //
  // void _onConnectivityChanged(
  //     ConnectivityChanged event,
  //     Emitter<ConnectivityState> emit,
  //     ) {
  //   emit(event.isConnected ? ConnectivityOnline() : ConnectivityOffline());
  // }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }

}

