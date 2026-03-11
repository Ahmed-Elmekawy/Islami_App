import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamy/core/constants.dart';
import 'package:islamy/core/utils/app_colors.dart';
import 'package:islamy/core/widgets/error_message.dart';
import 'package:islamy/core/widgets/loading_indicator.dart';
import 'package:islamy/features/home/presentation/manager/azkar_bloc/azkar_cubit.dart';
import 'package:islamy/features/home/presentation/manager/azkar_bloc/azkar_states.dart';
import '../../../../../../../core/extensions/media_query_extension.dart';
import '../../../../../../../core/utils/app_routes.dart';

class Azkar extends StatelessWidget {
  const Azkar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AzkarCubit, AzkarStates>(
      builder: (context, state) {
        if (state is AzkarLoadingState) {
          return LoadingIndicator();
        }
        if (state is AzkarSuccessState) {
          final categories = state.categories;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Azkar", style: Theme.of(context).textTheme.bodyLarge),
              const SizedBox(height: 16),
              SizedBox(
                height: context.screenHeight*0.28,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  separatorBuilder: (context, index) => SizedBox(width: 10),
                  itemBuilder: (context, index) => InkWell(
                    onTap: () => Navigator.pushNamed(
                      context,
                      AppRoutes.azkarDetails,
                      arguments: categories[index],
                    ),
                    child: _buildAzkarCard(
                      context,
                      azkarCategories[index],
                      azkarImages[index],
                    ),
                  ),
                ),
              ),
            ],
          );
        }
        if (state is AzkarErrorState) {
          return ErrorMessage(state.errorMessage);
        }
        return SizedBox.shrink();
      },
    );
  }

  Widget _buildAzkarCard(BuildContext context, String title, String imagePath) {
    return Container(
      width: context.screenWidth * 0.5,
      padding: const EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
        color: AppColors.secondary,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.primary, width: 2),
      ),
      child: Column(
        children: [
          Expanded(child: Image.asset(imagePath, fit: BoxFit.contain)),
          const SizedBox(height: 12),
          Text(
            title,
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(color: AppColors.white),
          ),
        ],
      ),
    );
  }
}
