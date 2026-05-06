import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islamy/core/utils/app_assets.dart';
import 'package:islamy/core/utils/app_colors.dart';
import 'package:islamy/features/home/view_model/bloc/home_bloc.dart';
import 'package:islamy/features/home/view_model/bloc/home_event.dart';
import 'package:islamy/features/home/view_model/bloc/home_state.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        final bloc = context.read<HomeBloc>();
        return Scaffold(
          body: bloc.tabs[bloc.selectedIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: bloc.selectedIndex,
            onTap: (index) {
              bloc.add(ChangeTabEvent(context: context, index: index));
            },
            items: [
              _buildBottomNavItem(
                AppIcons.quran,
                "Quran",
                0,
                bloc.selectedIndex,
              ),
              _buildBottomNavItem(
                AppIcons.hadith,
                "Hadith",
                1,
                bloc.selectedIndex,
              ),
              _buildBottomNavItem(
                AppIcons.sebha,
                "Sebha",
                2,
                bloc.selectedIndex,
              ),
              _buildBottomNavItem(
                AppIcons.radio,
                "Radio",
                3,
                bloc.selectedIndex,
              ),
              _buildBottomNavItem(
                AppIcons.timing,
                "Timing",
                4,
                bloc.selectedIndex,
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


