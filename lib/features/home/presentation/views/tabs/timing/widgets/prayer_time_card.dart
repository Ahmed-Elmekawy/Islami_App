import 'package:flutter/material.dart';
import 'package:islamy/core/utils/app_colors.dart';
import 'package:islamy/features/home/data/models/prayer_time_model.dart';

class PrayerTimeCard extends StatelessWidget {
  final PrayerTimeModel prayerTime;

  const PrayerTimeCard({super.key, required this.prayerTime});

  @override
  Widget build(BuildContext context) {
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
              prayerTime.label,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          SizedBox(height: 4,),
          FittedBox(
            child: Text(
              prayerTime.time,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: AppColors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 4,),
          FittedBox(
            child: Text(
              prayerTime.period,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
        ],
      ),
    );
  }
}
