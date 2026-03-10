import 'package:flutter/material.dart';
import '../../../../../../../core/constants.dart';
import '../../../../../../../core/utils/app_colors.dart';
import '../../../../manager/timing_bloc/timing_cubit.dart';

class NextPrayIndicator extends StatelessWidget {
  final String nextPrayTime;
  const NextPrayIndicator(this.nextPrayTime, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FittedBox(
          child: Text(
            "Next Pray - $nextPrayTime",
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
