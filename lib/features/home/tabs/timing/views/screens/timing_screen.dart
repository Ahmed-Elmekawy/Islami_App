import 'package:flutter/material.dart';
import 'package:islamy/core/utils/app_assets.dart';
import 'package:islamy/core/widgets/mosque_header.dart';
import 'package:islamy/core/constants.dart';
import 'package:islamy/core/widgets/custom_background.dart';
import '../widgets/pray_timing.dart';
import '../widgets/azkar_widget.dart';

class TimingScreen extends StatelessWidget {
  const TimingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomBackground(
          imagePath: AppImages.timingBg,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(kDefaultPadding),
            child: const Column(
              children: [MosqueHeader(), PrayTiming(), AzkarWidget()],
            ),
          ),
        ),
      ),
    );
  }
}
