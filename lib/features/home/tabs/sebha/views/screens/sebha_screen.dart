import 'package:flutter/material.dart';
import 'package:islamy/core/utils/app_assets.dart';
import 'package:islamy/core/widgets/custom_background.dart';
import 'package:islamy/core/constants.dart';
import '../widgets/sebha_header.dart';
import '../widgets/sebha_counter.dart';

class SebhaScreen extends StatelessWidget {
  const SebhaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      imagePath: AppImages.sebhaBg,
      child: const SafeArea(
        child: Padding(
          padding: EdgeInsets.all(kDefaultPadding),
          child: Column(children: [SebhaHeader(), Spacer(), SebhaCounter()]),
        ),
      ),
    );
  }
}
