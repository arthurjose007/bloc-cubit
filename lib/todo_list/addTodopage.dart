import 'package:bloc_counter/todo_list/cubit/todo_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddTodoPage extends StatelessWidget {
  AddTodoPage({super.key});

  TextEditingController textEditingController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text("Add items"),),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextField(controller: textEditingController,
              decoration: InputDecoration(
                labelText: 'Enter the activity',
                    hintText:'Title',
              ),
            ),
            SizedBox(height: 10,),
            ElevatedButton(onPressed: (){
             // BlocProvider.of<TodoCubit>(context).addTodo(textEditingController.text.trim());
              context.read<TodoCubit>().addTodo(textEditingController.text.trim());
              Navigator.of(context).pop();

            }, child:Text('Add'))
          ],
        ),
      ),
     
    );
  }
}
