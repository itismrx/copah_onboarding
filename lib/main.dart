import 'package:coopah_onboarding/config/theme/theme.dart';
import 'package:coopah_onboarding/dep_injection.dart';
import 'package:coopah_onboarding/features/weather/presentation/bloc/cubit/temp_unit_cubit.dart';
import 'package:coopah_onboarding/features/weather/presentation/bloc/weather_bloc.dart';
import 'package:coopah_onboarding/features/weather/presentation/screens/home_page.dart';
import 'package:flutter/material.dart';
import "package:flutter_bloc/flutter_bloc.dart";

void main() async {
  initDepInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: appTheme,
        home: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => serviceLocater<TempUnitCubit>(),
            ),
            BlocProvider(
              create: (context) =>
                  serviceLocater<WeatherBloc>()..add(const WeatherDataFetch()),
            ),
          ],
          child: const HomePage(),
        ));
  }
}
