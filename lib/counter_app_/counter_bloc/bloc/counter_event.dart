part of 'counter_bloc.dart';

sealed class CounterEvent {}

class CounterIncremented extends CounterEvent {}

final class CounterDecremented extends CounterEvent {}

final class CounterRestart extends CounterEvent {}

