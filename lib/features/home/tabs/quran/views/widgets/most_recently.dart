import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamy/core/extensions/media_query_extension.dart';
import 'package:islamy/core/widgets/error_message.dart';
import 'package:islamy/core/widgets/loading_indicator.dart';
import 'package:islamy/core/constants.dart';
import '../../view_model/bloc/quran_event.dart';
import 'most_recently_item.dart';
import '../../view_model/bloc/quran_bloc.dart';
import '../../view_model/bloc/quran_state.dart';

class MostRecently extends StatelessWidget {
  const MostRecently({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: kDefaultPadding),
      child: BlocBuilder<QuranBloc, QuranState>(
        buildWhen: (previous, current) =>
            current is QuranLoaded ||
            current is QuranLoading ||
            current is QuranError,
        builder: (context, state) {
          if (state is QuranLoading) {
            return const LoadingIndicator();
          }
          if (state is QuranLoaded && state.recentSuras.isNotEmpty) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Most Recently",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: context.screenHeight * 0.2,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemCount: state.recentSuras.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 15),
                    itemBuilder: (context, index) {
                      return MostRecentlyItem(
                        suraModel: state.recentSuras[index],
                      );
                    },
                  ),
                ),
              ],
            );
          }
          if (state is QuranError) {
            return ErrorMessage(
              state.message,
              onRetry: () =>
                  context.read<QuranBloc>().add(LoadQuranDataEvent()),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
