import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamy/core/utils/app_assets.dart';
import 'package:islamy/core/widgets/custom_background.dart';
import 'package:islamy/features/home/tabs/radio/view_model/bloc/radio_bloc.dart';
import 'package:islamy/features/home/tabs/radio/view_model/bloc/radio_state.dart';
import 'package:islamy/features/home/tabs/radio/view_model/bloc/radio_event.dart';
import 'package:islamy/features/home/tabs/radio/data/models/reciter_model.dart';
import 'package:islamy/features/home/tabs/quran/data/suras_data.dart';
import '../../view_model/bloc/reciter_details_bloc.dart';
import '../../view_model/bloc/reciter_details_event.dart';
import '../../view_model/bloc/reciter_details_state.dart';
import '../../../home/tabs/radio/views/widgets/radio_item_card.dart';

class ReciterDetailsView extends StatelessWidget {
  const ReciterDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final reciter = ModalRoute.of(context)!.settings.arguments as ReciterModel;

    return BlocProvider(
      create: (context) =>
          ReciterDetailsBloc()..add(LoadReciterDetailsEvent(reciter)),
      child: BlocBuilder<ReciterDetailsBloc, ReciterDetailsState>(
        builder: (context, state) {
          if (state is ReciterDetailsLoaded) {
            return CustomBackground(
              imagePath: AppImages.radioBg,
              child: Scaffold(
                backgroundColor: Colors.transparent,
                appBar: AppBar(
                  title: Text(state.reciter.name),
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                ),
                body: BlocBuilder<RadioBloc, RadioState>(
                  builder: (context, radioState) {
                    String? currentUrl;
                    if (radioState is RadioLoaded) {
                      currentUrl = radioState.currentlyPlayingUrl;
                    }
                    return ListView.builder(
                      padding: const EdgeInsets.only(bottom: 24),
                      itemCount: quranSurasList.length,
                      itemBuilder: (context, index) {
                        final sura = quranSurasList[index];
                        final moshaf = state.reciter.moshaf.isNotEmpty
                            ? state.reciter.moshaf.first
                            : null;
                        if (moshaf == null) return const SizedBox.shrink();

                        final suraNumberStr =
                            sura.suraNumber.toString().padLeft(3, '0');
                        final playUrl = moshaf.server.endsWith('/')
                            ? '${moshaf.server}$suraNumberStr.mp3'
                            : '${moshaf.server}/$suraNumberStr.mp3';
                        final isPlaying = currentUrl == playUrl;
                        return RadioItemCard(
                          title: "${sura.nameEnglish} - ${sura.nameArabic}",
                          isPlaying: isPlaying,
                          onPlayToggle: () {
                            if (isPlaying) {
                              context.read<RadioBloc>().add(StopAudioEvent());
                            } else {
                              context.read<RadioBloc>().add(
                                    PlayAudioEvent(playUrl),
                                  );
                            }
                          },
                        );
                      },
                    );
                  },
                ),
              ),
            );
          }
          return const Scaffold(
              body: Center(child: CircularProgressIndicator()));
        },
      ),
    );
  }
}
