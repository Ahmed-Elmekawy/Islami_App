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
      children: [
        Expanded(
          child: _DateColumn(
            crossAxisAlignment: CrossAxisAlignment.start,
            line1: "${gregorian.day} ${gregorian.month.en},",
            line2: gregorian.year,
          ),
        ),
        Expanded(
          child: Column(
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
        ),
        Expanded(
          child: _DateColumn(
            crossAxisAlignment: CrossAxisAlignment.end,
            line1: "${hijri.day} ${hijri.month.en},",
            line2: hijri.year,
          ),
        ),
      ],
    );
  }
}

class _DateColumn extends StatelessWidget {
  final String line1;
  final String line2;
  final CrossAxisAlignment crossAxisAlignment;

  const _DateColumn({
    required this.line1,
    required this.line2,
    required this.crossAxisAlignment,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAxisAlignment,
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
