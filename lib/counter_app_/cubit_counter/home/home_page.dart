import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';
import '../cubit_counnte/cubit/counter_state.dart';
import 'countvalue_nextpage.dart';

class MyHomePage extends StatelessWidget {
   MyHomePage({super.key, required this.title});

  final String title;

  //final counterCubit=CountCubit();

  @override
  Widget build(BuildContext context) {
    final counterCubit=BlocProvider.of<CountCubit>(context);


    //   return BlocBuilder<CountCubit, int>(
  //     bloc: counterCubit,
  // builder: (context, count) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            BlocBuilder<CountCubit, int>(
              bloc: counterCubit,
              builder: (context, state) {
                return Text(
                  '$state',
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
            TextButton(onPressed: (){
             Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CountNextValue()));
            }, child: Text("next Page"))
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [

          FloatingActionButton(
            heroTag: null,
            onPressed:() {
              counterCubit.increment();

            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            heroTag: null,
            onPressed:() {
              counterCubit.decrement();

            },
            tooltip: 'Decrement',
            child: const Icon(Icons.minimize),
          ),
        ],
      ),
    );
 // },
//);
  }
}
