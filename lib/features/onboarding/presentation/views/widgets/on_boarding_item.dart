import 'package:flutter/material.dart';
import 'package:islamy/core/extensions/media_query_extension.dart';
import 'package:islamy/core/utils/app_colors.dart';
import '../../../../../core/widgets/mosque_header.dart';
import '../../../data/models/onboarding_model.dart';

class OnBoardingItem extends StatelessWidget {
  final OnboardingModel onboardingModel;
  const OnBoardingItem({super.key, required this.onboardingModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MosqueHeader(),
        const Spacer(),
        SizedBox(
          width: context.screenWidth * 0.8,
          height: context.screenHeight * 0.35,
          child: Image.asset(onboardingModel.image, fit: BoxFit.contain),
        ),
        const Spacer(),
        Text(
          onboardingModel.title,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        if (onboardingModel.desc != null) ...[
          const Spacer(),
          Text(
            onboardingModel.desc!,
            textAlign: TextAlign.center,
            style: Theme.of(
              context,
            ).textTheme.bodyLarge?.copyWith(color: AppColors.primary),
          ),
        ],
        const Spacer(),
      ],
    );
  }
}
