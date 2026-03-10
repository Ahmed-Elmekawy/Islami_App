import 'package:flutter/material.dart';
import 'package:islamy/core/utils/app_colors.dart';
import 'package:islamy/features/home/data/models/pray_timing_model.dart';
import 'package:islamy/features/home/presentation/manager/timing_bloc/timing_cubit.dart';

class PrayerTimeCard extends StatelessWidget {
  final String prayerName;
  final Timings timings;

  const PrayerTimeCard({
    super.key,
    required this.prayerName,
    required this.timings,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = TimingCubit.get(context);
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          colors: [AppColors.secondary, Color(0xFFB19768)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FittedBox(
            child: Text(
              prayerName,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          const SizedBox(height: 4),
          FittedBox(
            child: Text(
              cubit.getPrayerTime(timings, prayerName),
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(color: AppColors.white),
            ),
          ),
          const SizedBox(height: 4),
          FittedBox(
            child: Text(
              cubit.getPeriod(timings, prayerName),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }
}
