import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/counter_bloc.dart';
import '../counter_bloc/counter_bloc.dart';

class CounterPageWrapper extends StatelessWidget {
  const CounterPageWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (_) => CounterBloc()),
    ], child: CounterPage());
  }
}

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocConsumer<CounterBlocs, CounterState>(
      listener: (context, state) {
        if (state.value == 5) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: const Text('Action completed successfully!'),
          ));
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Container(
            height: size.height,
            width: size.width,
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Count = ${state.value}",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
                ),
                ElevatedButton(
                    onPressed: () {
                      context.read<CounterBlocs>().add(IncCountEvent());
                    },
                    child: Text("Increment")),
                ElevatedButton(
                    onPressed: () {
                      context.read<CounterBlocs>().add(DecCountEvent());
                    },
                    child: Text("Decrement"))
              ],
            ),
          ),
        );
      },
    );
  }
}
