import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBlocs extends Bloc<CounterEvent, CounterState> {
  CounterBlocs() : super(CounterState()) {
    on<IncCountEvent>(_onGetIncCount);
    on<DecCountEvent>(_onGetDecCount);
  }
  Future<void> _onGetIncCount(
      IncCountEvent event, Emitter<CounterState> emit) async {
    emit(state.copyWith(value: state.value + 1));
  }

  Future<void> _onGetDecCount(
      DecCountEvent event, Emitter<CounterState> emit) async {
    emit(state.copyWith(value: state.value - 1));
  }
}
