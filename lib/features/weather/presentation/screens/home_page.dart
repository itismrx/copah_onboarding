import 'package:coopah_onboarding/core/constants/constants.dart';
import 'package:coopah_onboarding/features/weather/domain/entities/weather.dart';
import 'package:coopah_onboarding/features/weather/presentation/bloc/cubit/temp_unit_cubit.dart';
import 'package:coopah_onboarding/features/weather/presentation/bloc/weather_bloc.dart';
import 'package:coopah_onboarding/features/weather/presentation/widgets/weather_display_widget.dart';
import 'package:coopah_onboarding/features/weather/presentation/widgets/widgets.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 24, right: 24, top: 16),
          // Listen to the changes on temp unit cubit to update the weather fetching unit
          child: BlocListener<TempUnitCubit, TempUnitState>(
            listener: (context, state) {
              TempUnit unit = (state as TempUnitCurrentState).tempUnit;
              context.read<WeatherBloc>().add(
                    WeatherDataFetch(
                      unit: unit,
                    ),
                  );
            },
            child: BlocBuilder<WeatherBloc, WeatherState>(
              builder: (context, state) {
                // waiting for a weather data
                if (state is WeatherLoading || state is WeatherInitial) {
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                }
                // failed to get weather data
                else if (state is WeatherError) {
                  return WeatherErrorWidget(errorMessage: state.message);
                }
                // received weather data successfully
                else {
                  WeatherEntity weather =
                      (state as WeatherSuccess).weatherEntity;

                  return WeatherDisplayWidget(weather: weather);
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
