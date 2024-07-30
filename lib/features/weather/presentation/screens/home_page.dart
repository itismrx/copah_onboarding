import 'package:cached_network_image/cached_network_image.dart';
import 'package:coopah_onboarding/core/constants/constants.dart';
import 'package:coopah_onboarding/features/weather/presentation/widgets/gap.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 24, right: 24, top: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: const BoxDecoration(color: AppColors.cardColor),
                width: double.maxFinite,
                height: 299,
                child: AspectRatio(
                  aspectRatio:
                      MediaQuery.of(context).size.width < 300 ? 4 / 3 : 16 / 9,
                  child: CachedNetworkImage(
                    imageUrl: "http://openweathermap.org/img/w/01d.png",
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
                    "24 degrees",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const Gap(height: 8),
                  Text(
                    "Location",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const Gap(height: 8),
                  Text(
                    "London",
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
                  Switch.adaptive(value: false, onChanged: (value) {})
                ],
              ),
              const Expanded(child: SizedBox.expand()),
              Flexible(
                  child: ElevatedButton(
                onPressed: () {},
                style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
                    minimumSize: const WidgetStatePropertyAll(
                        Size(double.maxFinite, 52))),
                child: Text(
                  "Refresh",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
