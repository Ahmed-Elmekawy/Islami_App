import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamy/core/constants.dart';
import 'package:islamy/core/widgets/radio_item.dart';
import '../../../home/data/models/reciters_model.dart';
import '../../../home/presentation/manager/radio_bloc/radio_cubit.dart';
import '../../../home/presentation/manager/radio_bloc/radio_states.dart';

class ReciterDetailsView extends StatefulWidget {
  const ReciterDetailsView({super.key});

  @override
  State<ReciterDetailsView> createState() => _ReciterDetailsViewState();
}

class _ReciterDetailsViewState extends State<ReciterDetailsView> {
  late ReciterModel reciter;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    reciter = ModalRoute.of(context)!.settings.arguments as ReciterModel;
  }

  @override
  Widget build(BuildContext context) {
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
            return ListView.separated(
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
            );
          },
        ),
      ),
    );
  }
}
