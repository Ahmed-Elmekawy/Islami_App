import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islamy/core/utils/app_assets.dart';
import 'package:islamy/core/utils/app_colors.dart';
import 'package:islamy/core/utils/app_routes.dart';
import 'package:islamy/features/home/data/models/sura_model.dart';
import '../../../../../../../core/constants.dart';
import '../../../../manager/quran_bloc/quran_cubit.dart';

class SuraItem extends StatelessWidget {
  final SuraModel suraModel;
  const SuraItem({super.key, required this.suraModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0.5 * kDefaultPadding),
      child: InkWell(
        onTap: () {
          QuranCubit.get(context).setMostRecentlyItem(suraModel);
          Navigator.pushNamed(
            context,
            AppRoutes.surahDetails,
            arguments: suraModel,
          );
        },
        child: Row(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                SvgPicture.asset(AppIcons.numberFrame, width: 50),
                Text(
                  "${suraModel.suraNumber}",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    suraModel.nameEnglish,
                    style: Theme.of(
                      context,
                    ).textTheme.titleMedium?.copyWith(color: AppColors.white),
                  ),
                  Text(
                    "${suraModel.versesCount} Verses",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
            Text(
              suraModel.nameArabic,
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(color: AppColors.white),
            ),
          ],
        ),
      ),
    );
  }
}
