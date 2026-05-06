import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/utils/app_routes.dart';
import '../../view_model/bloc/radio_bloc.dart';
import '../../view_model/bloc/radio_event.dart';
import '../../view_model/bloc/radio_state.dart';
import 'radio_item_card.dart';

class RadioListView extends StatelessWidget {
  final RadioLoaded state;

  const RadioListView({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    final items = state.isRadioSelected ? state.radios : state.reciters;

    return ListView.builder(
      padding: const EdgeInsets.only(bottom: 24),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        final itemName = state.isRadioSelected 
            ? (item as dynamic).name 
            : (item as dynamic).name;
        final itemUrl = state.isRadioSelected 
            ? (item as dynamic).url 
            : (item as dynamic).defaultUrl;
        final isPlaying = state.currentlyPlayingUrl == itemUrl;

        return RadioItemCard(
          title: itemName ?? 'Unknown',
          isPlaying: isPlaying,
          onPlayToggle: () {
            if (state.isRadioSelected) {
              if (isPlaying) {
                context.read<RadioBloc>().add(StopAudioEvent());
              } else {
                if (itemUrl != null && itemUrl.toString().isNotEmpty) {
                  context.read<RadioBloc>().add(PlayAudioEvent(itemUrl));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Audio URL not available")),
                  );
                }
              }
            } else {
              if (isPlaying) {
                context.read<RadioBloc>().add(StopAudioEvent());
              } else {
                if (itemUrl != null && itemUrl.toString().isNotEmpty) {
                  context.read<RadioBloc>().add(PlayAudioEvent(itemUrl));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Audio URL not available")),
                  );
                }
                Navigator.pushNamed(context, AppRoutes.reciterDetails, arguments: item);
              }
            }
          },
        );
      },
    );
  }
}
