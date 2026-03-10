import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamy/core/constants.dart';
import 'package:islamy/core/utils/app_routes.dart';
import 'package:islamy/core/widgets/error_message.dart';
import 'package:islamy/core/widgets/loading_indicator.dart';
import 'package:islamy/features/home/presentation/manager/radio_bloc/radio_cubit.dart';
import 'package:islamy/features/home/presentation/manager/radio_bloc/radio_states.dart';
import '../../../../../../../core/widgets/radio_item.dart';

class RecitersLists extends StatelessWidget {
  const RecitersLists({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RadioCubit, RadioStates>(
      builder: (context, state) {
        if (state is RadioLoadingState) {
          return LoadingIndicator();
        }
        if (state is RadioSuccessState) {
          final cubit = RadioCubit.get(context);
          return Expanded(
            child: ListView.separated(
              padding: EdgeInsets.zero,
              itemCount: state.reciters.length,
              separatorBuilder: (context, index) =>
                  const SizedBox(height: kDefaultPadding),
              itemBuilder: (context, index) {
                final reciter = state.reciters[index];
                return RadioItem(
                  name: reciter.name,
                  isPlaying: false,
                  isMuted: cubit.isMuted,
                  onPlayPressed: () {
                    final server = reciter.moshaf[0].server;
                    final firstSura = reciter.moshaf[0].surahList[0];
                    final firstSuraUrl = cubit.getSuraUrl(server, firstSura);
                    cubit.playRadio(firstSuraUrl);
                    Navigator.pushNamed(
                      context,
                      AppRoutes.reciterDetails,
                      arguments: reciter,
                    );
                  },
                  onMutePressed: () => cubit.toggleMute(),
                );
              },
            ),
          );
        }
        if (state is RadioErrorState) {
          return ErrorMessage(state.errorMessage);
        }
        return const SizedBox.shrink();
      },
    );
  }
}
