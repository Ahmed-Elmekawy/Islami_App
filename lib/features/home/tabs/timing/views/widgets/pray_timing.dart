import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamy/core/constants.dart';
import 'package:islamy/core/utils/app_colors.dart';
import 'package:islamy/core/widgets/error_message.dart';
import 'package:islamy/core/widgets/loading_indicator.dart';
import '../../view_model/bloc/timing_bloc.dart';
import '../../view_model/bloc/timing_event.dart';
import '../../view_model/bloc/timing_state.dart';
import 'next_pray_indicator.dart';
import 'pray_timing_header.dart';
import 'prayer_time_card.dart';

class PrayTiming extends StatelessWidget {
  const PrayTiming({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimingBloc, TimingState>(
      builder: (context, state) {
        if (state is TimingLoading) {
          return const LoadingIndicator();
        }
        if (state is TimingLoaded) {
          final date = state.timingData.date;
          final timings = state.timingData.timings;
          final bloc = context.read<TimingBloc>();
          return Container(
            margin: const EdgeInsets.symmetric(vertical: kDefaultPadding),
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
                      bloc.getNextPrayer(timings)["name"]!,
                    ),
                  ),
                ),
                const SizedBox(height: kDefaultPadding),
                NextPrayIndicator(bloc.getNextPrayer(timings)["time"]!),
              ],
            ),
          );
        }
        if (state is TimingError) {
          return ErrorMessage(
            state.message,
            onRetry: () {
              context.read<TimingBloc>().add(FetchTimingEvent());
            },
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
