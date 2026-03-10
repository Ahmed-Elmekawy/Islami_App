import 'package:flutter/material.dart';
import 'package:islamy/core/utils/app_routes.dart';
import '../../../../../../../core/constants.dart';
import '../../../../../../../core/utils/app_assets.dart';
import '../../../../../../../core/utils/app_colors.dart';
import '../../../../../data/models/sura_model.dart';
import '../../../../manager/quran_bloc/quran_cubit.dart';

class MostRecentlyItem extends StatelessWidget {
  final SuraModel suraModel;
  const MostRecentlyItem({super.key, required this.suraModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        QuranCubit.get(context).setMostRecentlyItem(suraModel);
        Navigator.pushNamed(
          context,
          AppRoutes.surahDetails,
          arguments: suraModel,
        );
      },
      child: Container(
        padding: const EdgeInsets.all(kDefaultPadding),
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  suraModel.nameEnglish,
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(color: AppColors.secondary),
                ),
                Text(
                  suraModel.nameArabic,
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(color: AppColors.secondary),
                ),
                Text(
                  "${suraModel.versesCount} Verses",
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(color: AppColors.secondary),
                ),
              ],
            ),
            Image.asset(
              AppImages.mostRecentImg,
              color: AppColors.secondary,
              fit: BoxFit.contain,
            ),
          ],
        ),
      ),
    );
  }
}
