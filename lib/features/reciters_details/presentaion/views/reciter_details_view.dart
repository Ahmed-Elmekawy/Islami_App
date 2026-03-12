import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamy/core/constants.dart';
import 'package:islamy/core/utils/app_assets.dart';
import 'package:islamy/core/widgets/custom_background.dart';
import 'package:islamy/core/widgets/radio_item.dart';
import '../../../home/data/models/reciters_model.dart';
import '../../../home/presentation/manager/radio_bloc/radio_cubit.dart';
import '../../../home/presentation/manager/radio_bloc/radio_states.dart';

class ReciterDetailsView extends StatelessWidget {
  const ReciterDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final reciter = ModalRoute.of(context)!.settings.arguments as ReciterModel;
    final moshaf = reciter.moshaf[0];

    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) {
          RadioCubit.get(context).stopAudio();
        }
      },
      child: Scaffold(
        appBar: AppBar(title: Text(reciter.name)),
        body: BlocBuilder<RadioCubit, RadioStates>(
          builder: (context, state) {
            final cubit = RadioCubit.get(context);
            return SafeArea(
              child: CustomBackground(
                imagePath: AppImages.splashBackground,
                child: ListView.separated(
                  padding: const EdgeInsets.all(kDefaultPadding),
                  itemCount: moshaf.surahList.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: kDefaultPadding),
                  itemBuilder: (context, index) {
                    final suraIndex = moshaf.surahList[index];
                    final suraUrl = cubit.getSuraUrl(moshaf.server, suraIndex);
                    return RadioItem(
                      name: cubit.getSuraName(suraIndex),
                      isPlaying: cubit.isPlaying(suraUrl),
                      isMuted: cubit.isMuted,
                      onPlayPressed: () => cubit.playRadio(suraUrl),
                      onMutePressed: () => cubit.toggleMute(),
                    );
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
