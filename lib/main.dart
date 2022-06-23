import 'package:flutter/material.dart';

void main() => runApp(SimpleApp());

class SimpleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sample.',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: TryApp(),
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
      body: const Center(child: Text('tried now')),
    );
  }
}
