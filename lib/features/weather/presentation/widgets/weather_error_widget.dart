import 'package:coopah_onboarding/features/weather/presentation/widgets/gap.dart';
import 'package:flutter/material.dart';

class WeatherErrorWidget extends StatelessWidget {
  const WeatherErrorWidget({super.key, required this.errorMessage});
  final String errorMessage;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            Icons.error,
            size: 64,
          ),
          const Gap(),
          Text(
            "Something went wrong",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const Gap(
            height: 16,
          ),
          Text(
            errorMessage,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
