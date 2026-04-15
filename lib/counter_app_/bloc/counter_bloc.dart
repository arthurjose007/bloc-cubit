

import 'package:flutter_bloc/flutter_bloc.dart';


 part 'counter_event.dart';
class CounterBloc extends Bloc<CounterEvent,int>{
  CounterBloc():super(0){
    on<CounterIncremented>((event,emit){
      emit(state+1);

    });

    on<CounterDecremented>((event,emit){
      if(state==0){
        return;
      }
      emit(state-1);
    });

  }
  void fn(CounterEvent event){
    switch(event){
      case CounterIncremented():
      case CounterDecremented():
      case CounterRestart():
    }
  }

  // void increment(){
  //   emit(state+1);
  // }
  // void decrement(){
  //   emit(state-1);
  // }
}