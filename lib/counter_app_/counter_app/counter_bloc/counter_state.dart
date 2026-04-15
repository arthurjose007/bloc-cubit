part of 'counter_bloc.dart';

class CounterState extends Equatable {
  final int value;

  const CounterState({
    this.value = 0,
  });

  factory CounterState.initial() => const CounterState();

  CounterState copyWith({
    int? value,
  }) {
    return CounterState(
      value: value ?? this.value,
    );
  }

  @override
  List<Object?> get props => [
        value,
      ];
}
