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
        return GestureDetector(
          onTap: cubit.onSebhaClick,
          child: Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              Positioned(
                top: -context.screenHeight * 0.1,
                right: context.screenWidth * 0.23,
                child: Image.asset(
                  AppImages.headOfSebeha,
                  height: context.screenHeight * 0.12,
                ),
              ),
              AnimatedRotation(
                turns: cubit.angle,
                duration: const Duration(milliseconds: 300),
                child: Image.asset(
                  AppImages.sebha,
                  width: context.screenWidth * 0.85,
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    cubit.azkar[cubit.index],
                    style: Theme.of(context).textTheme.headlineMedium,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '${cubit.counter}',
                    style: Theme.of(context).textTheme.headlineLarge,
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
