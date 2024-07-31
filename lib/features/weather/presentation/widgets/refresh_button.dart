import 'package:coopah_onboarding/core/constants/constants.dart';
import 'package:coopah_onboarding/features/weather/presentation/bloc/cubit/temp_unit_cubit.dart';
import 'package:coopah_onboarding/features/weather/presentation/bloc/weather_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RefreshButton extends StatelessWidget {
  const RefreshButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: ElevatedButton(
      onPressed: () {
        // Get the current unit before firiing a refetch event
        TempUnit unit =
            (context.read<TempUnitCubit>().state as TempUnitCurrentState)
                .tempUnit;

        // Fire an event to refech data
        context.read<WeatherBloc>().add(
              WeatherDataFetch(unit: unit),
            );
      },
      style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
          minimumSize:
              const WidgetStatePropertyAll(Size(double.maxFinite, 52))),
      child: Text(
        "Refresh",
        style: Theme.of(context)
            .textTheme
            .bodyMedium
            ?.copyWith(color: AppColors.whiteColor),
      ),
    ));
  }
}
