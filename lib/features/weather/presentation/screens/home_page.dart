import 'package:cached_network_image/cached_network_image.dart';
import 'package:coopah_onboarding/core/constants/constants.dart';
import 'package:coopah_onboarding/features/weather/domain/entities/weather.dart';
import 'package:coopah_onboarding/features/weather/presentation/bloc/cubit/temp_unit_cubit.dart';
import 'package:coopah_onboarding/features/weather/presentation/bloc/weather_bloc.dart';
import 'package:coopah_onboarding/features/weather/presentation/widgets/gap.dart';
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
                  return Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Something went wrong",
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        const Gap(
                          height: 16,
                        ),
                        Text(
                          state.message,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                }
                // receved weather data successfully
                else {
                  WeatherEntity weather =
                      (state as WeatherSuccess).weatherEntity;

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Icon that represent the weather state of the location
                      Container(
                        decoration:
                            const BoxDecoration(color: AppColors.cardColor),
                        width: double.maxFinite,
                        height: 299,
                        child: AspectRatio(
                          // if the screen is less than 300px the image aspect ratio should be 4/3
                          // else if the screen is greather than that image aspect ration should be 16/9
                          aspectRatio: MediaQuery.of(context).size.width < 300
                              ? 4 / 3
                              : 16 / 9,
                          child: CachedNetworkImage(
                            imageUrl: Urls.getIconUrl(weather.iconCode),
                          ),
                        ),
                      ),
                      const Gap(
                        height: 32,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          "THIS IS MY WEATHER APP",
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                      ),
                      const Gap(
                        height: 24,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Temprature",
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          const Gap(height: 8),
                          Text(
                            "${weather.temperature} degrees",
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          const Gap(height: 8),
                          Text(
                            "Location",
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          const Gap(height: 8),
                          Text(
                            weather.cityName,
                            style: Theme.of(context).textTheme.bodySmall,
                          )
                        ],
                      ),
                      const Gap(
                        height: 32,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Celsius/Fahrenheit",
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          const Gap(
                            width: 28,
                            isVertical: false,
                          ),
                          // Temprature Unit Toggle Button
                          BlocBuilder<TempUnitCubit, TempUnitState>(
                            builder: (context, state) {
                              TempUnit unit =
                                  (state as TempUnitCurrentState).tempUnit;
                              return Switch.adaptive(
                                  value: unit == TempUnit.metric,
                                  onChanged: (value) {
                                    context
                                        .read<TempUnitCubit>()
                                        .toggleUnit(unit);
                                  });
                            },
                          )
                        ],
                      ),
                      // a widget to fill the remaining space
                      const Expanded(child: SizedBox.expand()),

                      // Refresh Button
                      Flexible(
                          child: ElevatedButton(
                        onPressed: () {
                          // Get the current unit before firiing a refetch event
                          TempUnit unit = (context.read<TempUnitCubit>().state
                                  as TempUnitCurrentState)
                              .tempUnit;

                          // Fire an event to refech data
                          context.read<WeatherBloc>().add(
                                WeatherDataFetch(unit: unit),
                              );
                        },
                        style: Theme.of(context)
                            .elevatedButtonTheme
                            .style
                            ?.copyWith(
                                minimumSize: const WidgetStatePropertyAll(
                                    Size(double.maxFinite, 52))),
                        child: Text(
                          "Refresh",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ))
                    ],
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
