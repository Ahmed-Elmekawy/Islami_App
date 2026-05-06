import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamy/core/constants.dart';
import 'package:islamy/core/utils/app_colors.dart';
import 'package:islamy/core/widgets/error_message.dart';
import 'package:islamy/core/widgets/loading_indicator.dart';
import 'package:islamy/core/extensions/media_query_extension.dart';
import 'package:islamy/core/utils/app_routes.dart';
import '../../view_model/bloc/azkar_bloc.dart';
import '../../view_model/bloc/azkar_state.dart';
import '../../view_model/bloc/azkar_event.dart';

class AzkarWidget extends StatelessWidget {
  const AzkarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AzkarBloc, AzkarState>(
      builder: (context, state) {
        if (state is AzkarLoading) {
          return const LoadingIndicator();
        }
        if (state is AzkarLoaded) {
          final categories = state.categories;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Azkar",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: context.screenHeight * 0.28,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  separatorBuilder: (context, index) => const SizedBox(width: 12),
                  itemBuilder: (context, index) => InkWell(
                    onTap: () => Navigator.pushNamed(
                      context,
                      AppRoutes.azkarDetails,
                      arguments: categories[index],
                    ),
                    child: _AzkarCard(
                      title: azkarCategories[index],
                      imagePath: azkarImages[index],
                    ),
                  ),
                ),
              ),
            ],
          );
        }
        if (state is AzkarError) {
          return ErrorMessage(
            state.message,
            onRetry: () {
              context.read<AzkarBloc>().add(FetchAzkarEvent());
            },
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}

class _AzkarCard extends StatelessWidget {
  final String title;
  final String imagePath;

  const _AzkarCard({
    required this.title,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.screenWidth * 0.5,
      padding: const EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
        color: AppColors.secondary,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.primary.withOpacity(0.5), width: 2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Expanded(
            child: Hero(
              tag: title,
              child: Image.asset(imagePath, fit: BoxFit.contain),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            title,
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: AppColors.white,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ],
      ),
    );
  }
}



