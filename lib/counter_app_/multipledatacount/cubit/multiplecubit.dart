import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CountwithColor {
  final int count;
  final Color color;
  CountwithColor({required this.color, required this.count});
  CountwithColor copywith({int? count, Color? color}) {
    return CountwithColor(
      color: color ?? Colors.blue,
      count: count ?? this.count,
    );
  }
}

class CountCubit extends Cubit<CountwithColor> {
  CountCubit() : super(CountwithColor(count: 0, color: Colors.blue));

  void increment() {
    // print("before $state");
    emit(state.copywith(count: state.count + 1));
    // print("after $state");
  }

  void decrement() {
    if (state.count > 0) {
      emit(state.copywith(count: state.count - 1));
    }
  }

  void randomcolorChange() {
    final random = Random();
    emit(
      state.copywith(
        color: Color.fromARGB(
          255,
          random.nextInt(255),
          random.nextInt(255),
          random.nextInt(255),
        ),
      ),
    );
  }
}
