import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islamy/core/utils/app_assets.dart';
import 'package:islamy/core/utils/app_colors.dart';
import 'package:islamy/features/home/presentation/manager/home_bloc/home_cubit.dart';
import 'package:islamy/features/home/presentation/manager/home_bloc/home_states.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeStates>(
      builder: (context, state) {
        HomeCubit cubit = HomeCubit.get(context);
        return Scaffold(
          body: cubit.tabs[cubit.selectedIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.selectedIndex,
            onTap: (index) {
              cubit.changeBottomNav(context,index);
            },
            items: [
              _buildBottomNavItem(
                AppIcons.quran,
                "Quran",
                0,
                cubit.selectedIndex,
              ),
              _buildBottomNavItem(
                AppIcons.hadith,
                "Hadith",
                1,
                cubit.selectedIndex,
              ),
              _buildBottomNavItem(
                AppIcons.sebha,
                "Sebha",
                2,
                cubit.selectedIndex,
              ),
              _buildBottomNavItem(
                AppIcons.radio,
                "Radio",
                3,
                cubit.selectedIndex,
              ),
              _buildBottomNavItem(
                AppIcons.timing,
                "Timing",
                4,
                cubit.selectedIndex,
              ),
            ],
          ),
        );
      },
    );
  }

  BottomNavigationBarItem _buildBottomNavItem(
    String iconPath,
    String label,
    int index,
    int selectedIndex,
  ) {
    final bool isSelected = selectedIndex == index;
    return BottomNavigationBarItem(
      icon: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.secondary.withValues(alpha: 0.6)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: SvgPicture.asset(
          iconPath,
          colorFilter: ColorFilter.mode(
            isSelected ? AppColors.white : AppColors.secondary,
            BlendMode.srcIn,
          ),
        ),
      ),
      label: label,
    );
  }
}
