import 'package:flutter/material.dart';
import 'package:islamy/core/utils/app_assets.dart';
import 'package:islamy/core/widgets/custom_background.dart';
import 'package:islamy/features/home/presentation/views/tabs/sebha/widgets/sebha_counter.dart';
import 'package:islamy/features/home/presentation/views/tabs/sebha/widgets/sebha_header.dart';

import '../../../../../../core/constants.dart';

class SebhaTab extends StatelessWidget {
  const SebhaTab({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      imagePath: AppImages.sebhaBg,
      child: const SafeArea(
        child: Padding(
          padding: EdgeInsets.all(kDefaultPadding),
          child: Column(
            children: [
              SebhaHeader(),
              Spacer(),
              SebhaCounter(),
            ],
          ),
        ),
      ),
    );
  }
}
