import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamy/core/extensions/media_query_extension.dart';
import 'package:islamy/core/utils/app_assets.dart';
import '../../view_model/bloc/sebha_bloc.dart';
import '../../view_model/bloc/sebha_state.dart';
import '../../view_model/bloc/sebha_event.dart';

class SebhaCounter extends StatelessWidget {
  const SebhaCounter({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SebhaBloc, SebhaState>(
      builder: (context, state) {
        final bloc = context.read<SebhaBloc>();
        double screenWidth = context.screenWidth;
        double screenHeight = context.screenHeight;
        double baseSize = screenWidth * 0.8;
        if (baseSize > screenHeight * 0.4) {
          baseSize = screenHeight * 0.4;
        }

        // Default values for initial state
        int counter = 0;
        double angle = 0;
        String currentZikr = "سبحان الله";

        if (state is SebhaUpdateState) {
          counter = state.counter;
          angle = state.angle;
          currentZikr = state.currentZikr;
        }

        return GestureDetector(
          onTap: () => bloc.add(SebhaClickedEvent()),
          behavior: HitTestBehavior.opaque,
          child: Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              Positioned(
                top: -baseSize * 0.25,
                right: baseSize * 0.28,
                child: Image.asset(
                  AppImages.headOfSebeha,
                  height: baseSize * 0.3,
                ),
              ),
              AnimatedRotation(
                turns: angle,
                duration: const Duration(milliseconds: 300),
                child: Image.asset(
                  AppImages.sebha,
                  width: baseSize,
                  height: baseSize,
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: baseSize * 0.1),
                    child: Text(
                      currentZikr,
                      style: Theme.of(context).textTheme.headlineMedium
                          ?.copyWith(fontSize: baseSize * 0.1),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: baseSize * 0.04),
                  Text(
                    '$counter',
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      fontSize: baseSize * 0.14,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
