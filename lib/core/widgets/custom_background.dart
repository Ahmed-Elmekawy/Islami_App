import 'package:flutter/material.dart';
import 'package:islamy/core/utils/app_colors.dart';

class CustomBackground extends StatelessWidget {
  final String imagePath;
  final Widget child;

  const CustomBackground({
    super.key,
    required this.imagePath,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        color: AppColors.secondary.withValues(alpha: 0.6),
        child: child,
      ),
    );
  }
}
