import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islamy/core/utils/app_assets.dart';
import 'package:islamy/core/utils/app_colors.dart';
import 'package:islamy/core/utils/app_styles.dart';
import '../../../../manager/quran_bloc/quran_cubit.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {
        QuranCubit.get(context).loadFilteredSuras(value.trim());
      },
      keyboardType: TextInputType.text,
      cursorColor: AppColors.white,
      style: AppStyles.bodyLarge.copyWith(color: AppColors.white),
      decoration: InputDecoration(
        hintText: "Sura Name",
        prefixIcon: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SvgPicture.asset(
            AppIcons.quran,
            colorFilter: const ColorFilter.mode(
              AppColors.primary,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
    );
  }
}
