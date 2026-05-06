import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamy/core/utils/app_assets.dart';
import 'package:islamy/core/widgets/custom_background.dart';
import 'package:islamy/core/widgets/error_message.dart';
import 'package:islamy/core/widgets/loading_indicator.dart';
import 'package:islamy/core/widgets/mosque_header.dart';
import 'package:islamy/core/constants.dart';
import '../../view_model/bloc/hadith_bloc.dart';
import '../../view_model/bloc/hadith_event.dart';
import '../../view_model/bloc/hadith_state.dart';
import '../widgets/hadith_item.dart';

class HadithScreen extends StatelessWidget {
  const HadithScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      imagePath: AppImages.hadithBg,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
          child: Column(
            children: [
              const MosqueHeader(),
              const SizedBox(height: kDefaultPadding),
              BlocBuilder<HadithBloc, HadithState>(
                builder: (context, state) {
                  if (state is HadithLoading) {
                    return const LoadingIndicator();
                  }
                  if (state is HadithLoaded) {
                    return Expanded(
                      child: CarouselSlider.builder(
                        itemCount: state.hadiths.length,
                        itemBuilder: (context, index, realIndex) =>
                            HadithItem(hadith: state.hadiths[index]),
                        options: CarouselOptions(
                          height: double.infinity,
                          viewportFraction: 0.7,
                          enlargeCenterPage: true,
                          enableInfiniteScroll: true,
                        ),
                      ),
                    );
                  }
                  if (state is HadithError) {
                    return ErrorMessage(
                      state.message,
                      onRetry: () {
                        context.read<HadithBloc>().add(FetchHadithsEvent());
                      },
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

