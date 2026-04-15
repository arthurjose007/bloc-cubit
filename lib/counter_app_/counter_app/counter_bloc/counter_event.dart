part of 'counter_bloc.dart';

abstract class CounterEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class DecCountEvent extends CounterEvent {
  DecCountEvent();

  @override
  List<Object?> get props => [];
}

class IncCountEvent extends CounterEvent {
  IncCountEvent();

  @override
  List<Object?> get props => [];
}
