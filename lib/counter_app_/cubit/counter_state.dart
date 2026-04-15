import 'package:flutter_bloc/flutter_bloc.dart';
class CountCubit extends Cubit<int>{
CountCubit():super(0);


void increment(){
 // print("before $state");
  emit(state+1);
 // print("after $state");

}void decrement(){
  if(state>0) {
    emit(state - 1);
  }

}

}

