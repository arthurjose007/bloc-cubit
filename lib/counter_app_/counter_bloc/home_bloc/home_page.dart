import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../counter_bloc/bloc/counter_bloc.dart';
import 'countvalue_nextpage.dart';

class MyHomePageBloc extends StatelessWidget {
  const MyHomePageBloc({super.key, required this.title});

  final String title;

  //final counterCubit=CountCubit();

  @override
  Widget build(BuildContext context) {
    final counterBloc=BlocProvider.of<CounterBloc>(context);


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
            BlocBuilder<CounterBloc, int>(
              builder: (context, state) {
                return Text(
                  '$state',
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
            TextButton(onPressed: (){
             Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CountNextValueBloc()));
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
              //  counterBloc.increment();

              counterBloc.add(CounterIncremented());

            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            heroTag: null,
            onPressed:() {
              // counterBloc.decrement();

              counterBloc.add(CounterDecremented());

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
