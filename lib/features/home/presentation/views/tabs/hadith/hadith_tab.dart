import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamy/core/utils/app_assets.dart';
import 'package:islamy/core/widgets/custom_background.dart';
import 'package:islamy/core/widgets/error_message.dart';
import 'package:islamy/core/widgets/loading_indicator.dart';
import 'package:islamy/core/widgets/mosque_header.dart';
import '../../../../../../core/constants.dart';
import '../../../manager/hadith_bloc/hadith_cubit.dart';
import '../../../manager/hadith_bloc/hadith_states.dart';
import 'widgets/hadith_item.dart';

class HadithTab extends StatelessWidget {
  const HadithTab({super.key});

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
              SizedBox(height: kDefaultPadding),
              BlocBuilder<HadithCubit, HadithStates>(
                builder: (context, state) {
                  if (state is HadithDataLoadingState) {
                    return LoadingIndicator();
                  }
                  if (state is HadithDataSuccessState) {
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
                  if (state is HadithDataErrorState) {
                    return ErrorMessage(state.errorMessage);
                  }
                  return SizedBox.shrink();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
