import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamy/core/extensions/media_query_extension.dart';
import 'package:islamy/core/utils/app_assets.dart';
import 'package:islamy/features/home/presentation/manager/sebha_bloc/sebha_cubit.dart';
import 'package:islamy/features/home/presentation/manager/sebha_bloc/sebha_states.dart';

class SebhaCounter extends StatelessWidget {
  const SebhaCounter({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SebhaCubit, SebhaStates>(
      builder: (context, state) {
        SebhaCubit cubit = SebhaCubit.get(context);
        double screenWidth = context.screenWidth;
        double screenHeight = context.screenHeight;
        double baseSize = screenWidth * 0.8;
        if (baseSize > screenHeight * 0.4) {
          baseSize = screenHeight * 0.4;
        }

        return GestureDetector(
          onTap: cubit.onSebhaClick,
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
                turns: cubit.angle,
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
                      cubit.azkar[cubit.index],
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                            fontSize: baseSize * 0.1,
                          ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: baseSize * 0.04),
                  Text(
                    '${cubit.counter}',
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
