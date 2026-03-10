import 'package:flutter/material.dart';
import '../../../../../core/constants.dart';
import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_colors.dart';

class CustomHeader extends StatelessWidget {
  final String title;

  const CustomHeader({super.key, required this.title});

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
              color: AppColors.primary,
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
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Flexible(
            child: Image.asset(
              AppImages.rightCorner,
              color: AppColors.primary,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}
