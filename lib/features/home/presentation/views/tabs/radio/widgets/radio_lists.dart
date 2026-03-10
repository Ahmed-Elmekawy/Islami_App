import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamy/core/constants.dart';
import 'package:islamy/core/widgets/error_message.dart';
import 'package:islamy/core/widgets/loading_indicator.dart';
import 'package:islamy/features/home/presentation/manager/radio_bloc/radio_cubit.dart';
import 'package:islamy/features/home/presentation/manager/radio_bloc/radio_states.dart';
import 'package:islamy/core/widgets/radio_item.dart';

class RadioLists extends StatelessWidget {
  const RadioLists({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RadioCubit, RadioStates>(
      builder: (context, state) {
        if (state is RadioLoadingState) {
          return const LoadingIndicator();
        }
        if (state is RadioSuccessState) {
          final cubit = RadioCubit.get(context);
          return Expanded(
            child: ListView.separated(
              padding: EdgeInsets.zero,
              itemCount: state.radios.length,
              separatorBuilder: (context, index) =>
                  const SizedBox(height: kDefaultPadding),
              itemBuilder: (context, index) {
                final radio = state.radios[index];
                return RadioItem(
                  name: radio.name,
                  isPlaying: cubit.isPlaying(radio.url),
                  isMuted: cubit.isMuted,
                  onPlayPressed: () => cubit.playRadio(radio.url),
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
