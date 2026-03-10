import 'package:flutter/material.dart';
import 'package:islamy/core/constants.dart';
import 'package:islamy/core/utils/app_styles.dart';
import 'package:islamy/core/widgets/mosque_header.dart';

class SebhaHeader extends StatelessWidget {
  const SebhaHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const MosqueHeader(),
        const SizedBox(height: kDefaultPadding),
        Text(
          'سَبِّحِ اسْمَ رَبِّكَ الْأَعْلَى',
          style: AppStyles.headlineMedium,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
