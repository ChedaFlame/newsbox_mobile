part of 'connectivity_bloc.dart';

abstract class ConnectivityState extends Equatable {
  const ConnectivityState(this.attempt);
  final int attempt;
  @override
  List<Object> get props => [];
}

class EmptyConnectivityState extends ConnectivityState {
  const EmptyConnectivityState() : super(0);
}

class InitiatingConnectivityState extends ConnectivityState {
  const InitiatingConnectivityState(super.attempt);
}

