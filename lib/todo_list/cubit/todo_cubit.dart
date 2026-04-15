import 'package:bloc/bloc.dart';

import '../model/todo_model.dart';


class TodoCubit extends Cubit<List<Todo>> {
  TodoCubit() : super([  ]);
  void addTodo(String title){
    if(title.isEmpty){
      addError('Title cannot be empty');
      return;
    }
    final todo=Todo(name: title, createAt: DateTime.now());
    //     state.add(todo);
    // emit([...state]);
    emit([...state,todo]);
  }
  @override
  void onChange(Change<List<Todo>> change) {
    // TODO: implement onChange
    super.onChange(change);
    print("Todo Cubit - $change");
  }
  @override
  void onError(Object error, StackTrace stackTrace) {
    // TODO: implement onError
    super.onError(error, stackTrace);
     print("TodoCubit-$error");
  }




}
