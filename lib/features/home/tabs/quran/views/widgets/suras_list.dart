import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamy/core/constants.dart';
import 'package:islamy/core/extensions/media_query_extension.dart';
import 'package:islamy/core/utils/app_colors.dart';
import '../../../../../../core/widgets/error_message.dart';
import '../../view_model/bloc/quran_bloc.dart';
import '../../view_model/bloc/quran_event.dart';
import '../../view_model/bloc/quran_state.dart';
import 'sura_item.dart';
import '../../../../../../../../core/widgets/loading_indicator.dart';

class SurasList extends StatelessWidget {
  const SurasList({super.key});

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
          if (state is QuranLoaded) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Suras List",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 10),
                state.filteredSuras.isNotEmpty
                    ? ListView.separated(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: state.filteredSuras.length,
                        separatorBuilder: (context, index) => Divider(
                          color: AppColors.white,
                          thickness: 1.5,
                          indent: context.screenWidth * 0.08,
                          endIndent: context.screenWidth * 0.08,
                        ),
                        itemBuilder: (context, index) {
                          return SuraItem(
                            suraModel: state.filteredSuras[index],
                          );
                        },
                      )
                    : Center(
                        child: Text(
                          "No Suras Found",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
              ],
            );
          }
          if (state is QuranLoading) {
            return const LoadingIndicator();
          }
          if (state is QuranError) {
            return ErrorMessage(
              state.message,
              onRetry: () {
                context.read<QuranBloc>().add(LoadQuranDataEvent());
              },
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
