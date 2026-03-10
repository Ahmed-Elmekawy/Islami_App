import 'package:flutter/material.dart';
import 'package:islamy/core/utils/app_colors.dart';
import 'package:islamy/core/utils/app_routes.dart';
import 'package:islamy/features/onboarding/data/onboarding_data.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../../core/utils/shared_pref_helper.dart';
import '../../../../../core/widgets/custom_text_button.dart';

class OnBoardingButtons extends StatelessWidget {
  final PageController controller;
  final int currentPage;

  const OnBoardingButtons({
    super.key,
    required this.controller,
    required this.currentPage,
  });

  @override
  Widget build(BuildContext context) {
    final bool isLastPage = currentPage == onBoardingContents.length - 1;
    final bool isFirstPage = currentPage == 0;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Visibility(
          visible: !isFirstPage,
          maintainSize: true,
          maintainAnimation: true,
          maintainState: true,
          child: CustomTextButton(
            text: "Back",
            onPressed: () => controller.previousPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            ),
          ),
        ),
        SmoothPageIndicator(
          controller: controller,
          count: onBoardingContents.length,
          effect: ExpandingDotsEffect(
            activeDotColor: AppColors.primary,
            dotColor: Colors.grey[600]!,
            dotHeight: 8,
            dotWidth: 8,
            spacing: 10,
          ),
        ),
        CustomTextButton(
          text: isLastPage ? "Finish" : "Next",
          onPressed: () {
            if (isLastPage) {
              SharedPrefHelper.saveData("onBoarding", false);
              Navigator.pushReplacementNamed(context, AppRoutes.home);
            } else {
              controller.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            }
          },
        ),
      ],
    );
  }
}
