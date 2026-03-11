import 'package:flutter/material.dart';

import '../../../../../core/constants.dart';
import '../../../../../core/utils/app_colors.dart';

class ZekrItem extends StatelessWidget {
  final Function(bool) onSelected;
  final bool isSelected;
  final String zekr;
  final String count;
  const ZekrItem({
    super.key,
    required this.onSelected,
    required this.zekr,
    required this.isSelected,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:() => onSelected(false),
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(kDefaultPadding),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.primary, width: 2),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                zekr,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: isSelected ? AppColors.secondary : AppColors.primary,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              "$count counts",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: isSelected
                    ? AppColors.secondary.withValues(alpha: 0.7)
                    : AppColors.primary.withValues(alpha: 0.7),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
