import 'dart:async';

// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'connectivity_event.dart';
part 'connectivity_state.dart';

class ConnectivityBloc extends Bloc<ConnectivityEvent, ConnectivityState> {
  StreamSubscription? _subscription;
  ConnectivityBloc() : super(ConnectivityInitial()) {
    on<ConnectivityEvent>((event, emit) {
      if (event is ConnectedEvent) {
        emit(ConnectedState(messsage: 'connected'));
      } else if (event is NotConnectedEvent) {
        emit(ConnectedState(messsage: 'not connected'));
      }
    });
    _subscription = Connectivity().onConnectivityChanged.listen((event) {
      if (event == ConnectivityResult.wifi ||
          event == ConnectivityResult.mobile) {
        add(ConnectedEvent());
      } else {
        add(NotConnectedEvent());
      }
    });
  }
  @override
  Future<void> close() {
    _subscription!.cancel();
    return super.close();
  }
}
