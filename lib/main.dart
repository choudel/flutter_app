import 'package:flutter/material.dart';
import 'package:flutter_app/data/cubit/counter_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(SimpleApp());

class SimpleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sample.',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: BlocProvider(
        create: (context) => CounterCubit(),
        child: TryApp(),
      ),
    );
  }
}

class TryApp extends StatefulWidget {
  const TryApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TryApp();
}

class _TryApp extends State<TryApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sample App'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('you have pushed button'),
          BlocBuilder<CounterCubit, CounterState>(
            builder: (context, state) {
              return Text(state.counterValue.toString(),
                  style: Theme.of(context).textTheme.headline4);
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FloatingActionButton(
                onPressed: () {
                  BlocProvider.of<CounterCubit>(context).decrement();
                },
                tooltip: "decrement",
                child: Icon(Icons.remove),
              ),
              FloatingActionButton(
                onPressed: () {
                  BlocProvider.of<CounterCubit>(context).increment();
                },
                tooltip: "Increment",
                child: Icon(Icons.add),
              ),
            ],
          )
        ],
      )),
    );
  }
}
