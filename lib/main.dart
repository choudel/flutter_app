import 'package:flutter/material.dart';
import 'package:flutter_app/cubit/weather_cubit.dart';
import 'package:flutter_app/data/weather_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'data/pages/weather_search_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: BlocProvider(
        create: (context) => WeatherCubit(FakeWeatherRepository()),
        child: const WeatherSearchPage(),
      ),
    );
  }
}
