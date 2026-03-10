import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamy/core/constants.dart';
import 'package:islamy/core/extensions/media_query_extension.dart';
import 'package:islamy/core/utils/app_colors.dart';
import 'package:islamy/features/home/presentation/views/tabs/quran/widgets/sura_item.dart';
import '../../../../manager/quran_bloc/quran_cubit.dart';
import '../../../../manager/quran_bloc/quran_sates.dart';

class SurasList extends StatelessWidget {
  const SurasList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: kDefaultPadding),
      child: BlocBuilder<QuranCubit, QuranStates>(
        builder: (context, state) {
          if (state is QuranDataSuccessState) {
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
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
