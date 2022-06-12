// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import 'package:flutter_app/cubit/weather_cubit.dart';
import 'package:flutter_app/data/weather_repository.dart';

import 'data/pages/weather_search_page.dart';

void main() => runApp(
      ChangeNotifierProvider(
          create: (_) => BreadCrumbProvider(),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: const MyApp(),
            routes: {'/new': (context) => const Material()},
          )),
    );

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MY MONSTEROUS app',
      home: Column(
        children: [
          Consumer<BreadCrumbProvider>(
            builder: (context, value, child) {
              return BreadCrumbWidget(breads: value.items);
            },
          ),
          AppBar(
            title: const Text('This project is cursed'),
          ),
          TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(
                  '/new',
                );
              },
              child: const Text('Add New Bread Crumb')),
          TextButton(
              onPressed: () {
                context.read<BreadCrumbProvider>().reset();
              },
              child: const Text('Reset')),
          BlocProvider(
            create: (context) => WeatherCubit(FakeWeatherRepository()),
            child: const WeatherSearchPage(),
          ),
        ],
      ),
    );
  }
}

class BreadCrumb {
  bool isActive;
  final String name;
  final String uuid;
  BreadCrumb({
    required this.isActive,
    required this.name,
  }) : uuid = const Uuid().v4();
  void activate() {
    isActive = true;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BreadCrumb &&
        other.isActive == isActive &&
        other.name == name &&
        other.uuid == uuid;
  }

  @override
  int get hashCode => isActive.hashCode ^ name.hashCode ^ uuid.hashCode;

  String get title => name + (isActive ? '>' : '');
}

class BreadCrumbProvider extends ChangeNotifier {
  final List<BreadCrumb> _items = [];
  UnmodifiableListView<BreadCrumb> get items => UnmodifiableListView(_items);
  void add(BreadCrumb breadCrumb) {
    for (final item in _items) {
      item.activate();
    }
    _items.add(breadCrumb);
    notifyListeners();
  }

  void reset() {
    _items.clear();
    notifyListeners();
  }
}

class BreadCrumbWidget extends StatelessWidget {
  final UnmodifiableListView<BreadCrumb> breads;
  const BreadCrumbWidget({Key? key, required this.breads}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: breads.map(
        (breadCrumb) {
          return Text(
            breadCrumb.title,
            style: TextStyle(
                color: breadCrumb.isActive ? Colors.red : Colors.black26),
          );
        },
      ).toList(),
    );
  }
}
