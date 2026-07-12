import 'package:bloc_counter/counter_app_/cubit_counter/cubit/counter_state.dart';
import 'package:bloc_counter/counter_app_/multipledatacount/cubit/multiplecubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MultipleDataChange extends StatelessWidget {
  MultipleDataChange({super.key});

  //final counterCubit=CountCubit();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //when you use blocbuilder it will trigger when any variable change so unnessery call so use blocselector
            BlocBuilder<CountColorCubit, CountwithColor>(
              builder: (context, state) {
                return Text(
                  '${state.count}',
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
            BlocSelector<CountColorCubit, CountwithColor, int>(
              selector: (state) => state.count,
              builder: (context, state) {
                return Text(
                  '${count}',
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
            BlocSelector<CountColorCubit, CountwithColor, Color>(
              selector: (state) => state.color,

              builder: (context, state) {
                return Text(
                  '${color}',
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
            ElevatedButton(
              onPressed: () {
                context.read<CountColorCubit>().increment();
              },
              child: const Icon(Icons.add),
            ),
            ElevatedButton(
              onPressed: () {
                context.read<CountColorCubit>().randomcolorChange();
              },
              child: const Text("Random color Change"),
            ),
          ],
        ),
      ),
    );
    // },
    //);
  }
}
