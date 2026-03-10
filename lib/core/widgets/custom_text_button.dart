import 'package:flutter/material.dart';
import 'package:islamy/core/utils/app_colors.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const CustomTextButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
          color: AppColors.primary,
        ),
      ),
    );
  }
}
