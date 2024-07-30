import 'package:coopah_onboarding/core/configuration/dep_injection.dart';
import 'package:coopah_onboarding/features/weather/presentation/bloc/weather_bloc.dart';
import 'package:coopah_onboarding/features/weather/presentation/screens/home_page.dart';
import 'package:flutter/material.dart';
import "package:flutter_bloc/flutter_bloc.dart";

void main() {
  initDepInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => serviceLocater<WeatherBloc>(),
            ),
          ],
          child: const HomePage(),
        ));
  }
}
