import 'package:bloc_counter/login_for_validation/auth/auth_bloc.dart';
import 'package:bloc_counter/todo_list/addTodopage.dart';
import 'package:bloc_counter/todo_list/cubit/todo_cubit.dart';
import 'package:bloc_counter/todo_list/todo_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_app_/counter_bloc/bloc/counter_bloc.dart';
import 'counter_app_/cubit_counter/cubit/counter_state.dart';
import 'counter_app_/counter_bloc/home_bloc/home_page.dart';
import 'login_for_validation/login_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
    providers: [
      BlocProvider(create: (_)=>CounterBloc()),
      BlocProvider(create: (_)=>CountCubit()),
      BlocProvider(create: (_)=>TodoCubit()),
      BlocProvider(create: (_)=>AuthBloc()),
    ],
    child:
      MaterialApp(
      //home: MyHomePageBloc(title: '',),
        initialRoute: '/',
        routes: {
        '/':(_)=>LoginScreen(),
        '/todo':(_)=>TodoList(),
        '/add-todo':(_)=> AddTodoPage(),
        },
    ));
  }
}

