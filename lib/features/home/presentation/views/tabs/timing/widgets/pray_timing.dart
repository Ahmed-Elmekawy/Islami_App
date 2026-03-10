import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:islamy/core/constants.dart';
import 'package:islamy/core/utils/app_colors.dart';
import '../../../../../data/prayer_time_data.dart';
import 'date_column.dart';
import 'prayer_time_card.dart';

class PrayTiming extends StatelessWidget {
  const PrayTiming({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: kDefaultPadding),
      padding: const EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
        color: AppColors.primary.withValues(alpha: 0.7),
        borderRadius: BorderRadius.circular(40),
      ),
      child: Column(
        children: [
          const _PrayTimingHeader(),
          const SizedBox(height: kDefaultPadding),
          CarouselSlider(
            options: CarouselOptions(
              height: 150,
              viewportFraction: 0.35,
              enlargeCenterPage: true,
              enableInfiniteScroll: true,
            ),
            items: prayerTimes
                .map((time) => PrayerTimeCard(prayerTime: time))
                .toList(),
          ),
          const SizedBox(height: kDefaultPadding),
          const _NextPrayIndicator(),
        ],
      ),
    );
  }
}

class _PrayTimingHeader extends StatelessWidget {
  const _PrayTimingHeader();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        DateColumn(line1: "16 Jul,", line2: "2024"),
        Column(
          children: [
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                "Pray Time",
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: AppColors.secondary.withValues(alpha: 0.7),
                ),
              ),
            ),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                "Tuesday",
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: AppColors.secondary.withValues(alpha: 0.7),
                ),
              ),
            ),
          ],
        ),
        DateColumn(line1: "09 Muh,", line2: "1446"),
      ],
    );
  }
}

class _NextPrayIndicator extends StatelessWidget {
  const _NextPrayIndicator();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FittedBox(
          child: Text(
            "Next Pray - 02:32",
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: AppColors.secondary.withValues(alpha: 0.7),
            ),
          ),
        ),
        const SizedBox(width: kDefaultPadding),
        Icon(Icons.volume_off, color: AppColors.secondary),
      ],
    );
  }
}
