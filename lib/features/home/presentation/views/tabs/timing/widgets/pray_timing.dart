import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamy/core/constants.dart';
import 'package:islamy/core/utils/app_colors.dart';
import 'package:islamy/core/widgets/error_message.dart';
import 'package:islamy/core/widgets/loading_indicator.dart';
import 'package:islamy/features/home/presentation/manager/timing_bloc/timing_cubit.dart';
import 'package:islamy/features/home/presentation/manager/timing_bloc/timing_states.dart';
import 'next_pray_indicator.dart';
import 'pray_timing_header.dart';
import 'prayer_time_card.dart';

class PrayTiming extends StatelessWidget {
  const PrayTiming({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimingCubit, TimingStates>(
      builder: (context, state) {
        if (state is TimingLoadingState) {
          return LoadingIndicator();
        }
        if (state is TimingSuccessState) {
          final date = state.data.date;
          final timings = state.data.timings;
          final cubit = TimingCubit.get(context);
          return Container(
            margin: EdgeInsets.symmetric(vertical: kDefaultPadding),
            padding: const EdgeInsets.all(kDefaultPadding),
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.7),
              borderRadius: BorderRadius.circular(40),
            ),
            child: Column(
              children: [
                PrayTimingHeader(date),
                const SizedBox(height: kDefaultPadding),
                CarouselSlider.builder(
                  itemCount: prayersNames.length,
                  itemBuilder: (context, index, realIndex) => PrayerTimeCard(
                    prayerName: prayersNames[index],
                    timings: timings,
                  ),
                  options: CarouselOptions(
                    height: 150,
                    viewportFraction: 0.35,
                    enlargeCenterPage: true,
                    enableInfiniteScroll: true,
                    initialPage: prayersNames.indexOf(
                      cubit.getNextPrayer(timings)["name"]!,
                    ),
                  ),
                ),
                const SizedBox(height: kDefaultPadding),
                NextPrayIndicator(cubit.getNextPrayer(timings)["time"]!),
              ],
            ),
          );
        }
        if (state is TimingErrorState) {
          return ErrorMessage(state.errorMessage);
        }
        return SizedBox.shrink();
      },
    );
  }
}
