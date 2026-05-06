import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamy/core/utils/app_colors.dart';
import '../../data/models/pray_timing_model.dart';
import '../../view_model/bloc/timing_bloc.dart';

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
    final bloc = context.read<TimingBloc>();
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
              bloc.getPrayerTime(timings, prayerName),
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(color: AppColors.white),
            ),
          ),
          const SizedBox(height: 4),
          FittedBox(
            child: Text(
              bloc.getPeriod(timings, prayerName),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }
}
