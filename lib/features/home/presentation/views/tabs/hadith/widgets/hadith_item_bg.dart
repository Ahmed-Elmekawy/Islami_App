import 'package:flutter/material.dart';
import '../../../../../../../core/utils/app_assets.dart';
import '../../../../../../../core/utils/app_colors.dart';

class HadithItemBg extends StatelessWidget {
  final Widget child;
  const HadithItemBg({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.primary,
        image: const DecorationImage(
          alignment: Alignment.center,
          opacity: 0.1,
          image: AssetImage(AppImages.readingIntro),
          fit: BoxFit.contain,
          colorFilter: ColorFilter.mode(AppColors.secondary, BlendMode.srcIn),
        ),
      ),
      child: child,
    );
  }
}
