import 'package:flutter/material.dart';
import 'package:islamy/core/constants.dart';

import '../../../../../../../core/utils/app_colors.dart';

class HadithContent extends StatelessWidget {
  final String content;
  const HadithContent({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: Text(
          content,
          textAlign: TextAlign.center,
          textDirection: TextDirection.rtl,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: AppColors.secondary,
            height: 2.2,
            wordSpacing: 2,
          ),
        ),
      ),
    );
  }
}
