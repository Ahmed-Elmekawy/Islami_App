import 'package:flutter/material.dart';
import 'package:islamy/core/constants.dart';
import '../../../../../../../core/utils/app_assets.dart';
import '../../../../../../../core/utils/app_colors.dart';

class HadithHeader extends StatelessWidget {
  final String title;
  const HadithHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kDefaultPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Image.asset(
              AppImages.leftCorner,
              color: AppColors.secondary,
              fit: BoxFit.contain,
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              title,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: AppColors.secondary,
              ),
            ),
          ),
          Flexible(
            child: Image.asset(
              AppImages.rightCorner,
              color: AppColors.secondary,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}
