part of 'connectivity_bloc.dart';

@immutable
sealed class ConnectivityState {}

final class ConnectivityInitial extends ConnectivityState {}

final class ConnectedState extends ConnectivityState {
  final String messsage;

  ConnectedState({required this.messsage});
}

final class NotConnectedState extends ConnectivityState {
  final String messsage;

  NotConnectedState({required this.messsage});
}
