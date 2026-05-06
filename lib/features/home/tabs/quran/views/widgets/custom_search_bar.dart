import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islamy/core/utils/app_assets.dart';
import 'package:islamy/core/utils/app_colors.dart';
import 'package:islamy/core/utils/app_styles.dart';
import '../../view_model/bloc/quran_bloc.dart';
import '../../view_model/bloc/quran_event.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {
        context.read<QuranBloc>().add(FilterSurasEvent(value.trim()));
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
