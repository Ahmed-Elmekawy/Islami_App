import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamy/core/constants.dart';
import 'package:islamy/core/utils/app_assets.dart';
import 'package:islamy/core/widgets/custom_background.dart';

import '../../../home/tabs/timing/data/models/azkar_model.dart';
import '../../view_model/bloc/azkar_details_bloc.dart';
import '../../view_model/bloc/azkar_details_event.dart';
import '../../view_model/bloc/azkar_details_state.dart';
import '../widgets/zekr_item.dart';

class AzkarDetailsView extends StatelessWidget {
  const AzkarDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final azkarCategory =
        ModalRoute.of(context)!.settings.arguments as AzkarCategory;

    return BlocProvider(
      create: (context) =>
          AzkarDetailsBloc()..add(LoadAzkarDetailsEvent(azkarCategory)),
      child: Scaffold(
        appBar: AppBar(title: Text(azkarCategory.name)),
        body: CustomBackground(
          imagePath: AppImages.splashBackground,
          child: SafeArea(
            child: BlocBuilder<AzkarDetailsBloc, AzkarDetailsState>(
              builder: (context, state) {
                if (state is AzkarDetailsLoaded) {
                  return ListView.separated(
                    padding: const EdgeInsets.all(kDefaultPadding),
                    itemBuilder: (context, index) {
                      return ZekrItem(
                        onSelected: (isChanged) {
                          context
                              .read<AzkarDetailsBloc>()
                              .add(DecrementZekrCountEvent(index));
                        },
                        zekr: state.category.items[index].content,
                        count: state.currentCounts[index].toString(),
                        isSelected: state.currentCounts[index] == 0,
                      );
                    },
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 16),
                    itemCount: state.category.items.length,
                  );
                }
                return const Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ),
      ),
    );
  }
}
