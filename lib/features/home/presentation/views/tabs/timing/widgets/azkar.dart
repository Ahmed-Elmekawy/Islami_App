import 'package:flutter/material.dart';
import 'package:islamy/core/constants.dart';
import 'package:islamy/core/extensions/media_query_extension.dart';
import 'package:islamy/core/utils/app_assets.dart';
import 'package:islamy/core/utils/app_colors.dart';

class Azkar extends StatelessWidget {
  const Azkar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Azkar", style: Theme.of(context).textTheme.bodyLarge),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: _buildAzkarCard(
                context,
                "Evening Azkar",
                AppImages.eveningAzkar,
              ),
            ),
            const SizedBox(width: kDefaultPadding),
            Expanded(
              child: _buildAzkarCard(
                context,
                "Morning Azkar",
                AppImages.morningAzkar,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildAzkarCard(BuildContext context, String title, String imagePath) {
    return Container(
      padding: const EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
        color: AppColors.secondary,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.primary, width: 2),
      ),
      child: Column(
        children: [
          Image.asset(imagePath, height: 120, fit: BoxFit.contain),
          const SizedBox(height: 12),
          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(color: AppColors.white),
          ),
        ],
      ),
    );
  }
}
