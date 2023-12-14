part of 'connectivity_bloc.dart';

@immutable
sealed class ConnectivityEvent {}

final class ConnectedEvent extends ConnectivityEvent {}
final class NotConnectedEvent extends ConnectivityEvent {}

