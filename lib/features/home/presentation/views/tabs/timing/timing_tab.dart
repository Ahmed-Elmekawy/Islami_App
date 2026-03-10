import 'package:flutter/material.dart';
import 'package:islamy/core/utils/app_assets.dart';
import 'package:islamy/core/widgets/mosque_header.dart';
import 'package:islamy/features/home/presentation/views/tabs/timing/widgets/pray_timing.dart';
import '../../../../../../core/constants.dart';
import '../../../../../../core/widgets/custom_background.dart';
import 'widgets/azkar.dart';

class TimingTab extends StatelessWidget {
  const TimingTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomBackground(
          imagePath: AppImages.timingBg,
          child: SingleChildScrollView(
            padding: EdgeInsets.all(kDefaultPadding),
            child: Column(
              children: [
                const MosqueHeader(),
                const PrayTiming(),
                const Azkar(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
