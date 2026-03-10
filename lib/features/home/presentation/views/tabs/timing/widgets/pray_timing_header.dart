import 'package:flutter/material.dart';
import '../../../../../../../core/utils/app_colors.dart';
import '../../../../../data/models/pray_timing_model.dart';

class PrayTimingHeader extends StatelessWidget {
  final Date date;
  const PrayTimingHeader(this.date, {super.key});

  @override
  Widget build(BuildContext context) {
    final gregorian = date.gregorian;
    final hijri = date.hijri;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _DateColumn(
          line1: "${gregorian.day} ${gregorian.month.en}",
          line2: gregorian.year,
        ),
        Column(
          children: [
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                "Pray Time",
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: AppColors.secondary.withValues(alpha: 0.7),
                ),
              ),
            ),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                gregorian.weekday.en,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: AppColors.secondary.withValues(alpha: 0.7),
                ),
              ),
            ),
          ],
        ),
        _DateColumn(line1: "${hijri.day} ${hijri.month.en}", line2: hijri.year),
      ],
    );
  }
}

class _DateColumn extends StatelessWidget {
  final String line1;
  final String line2;

  const _DateColumn({required this.line1, required this.line2});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(line1, style: Theme.of(context).textTheme.bodyLarge),
        ),
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(line2, style: Theme.of(context).textTheme.bodyLarge),
        ),
      ],
    );
  }
}
