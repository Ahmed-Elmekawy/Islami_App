import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamy/core/constants.dart';
import 'package:islamy/core/utils/app_assets.dart';
import 'package:islamy/core/widgets/custom_background.dart';
import 'package:islamy/core/widgets/mosque_header.dart';
import 'package:islamy/features/home/presentation/manager/radio_bloc/radio_cubit.dart';
import 'package:islamy/features/home/presentation/manager/radio_bloc/radio_states.dart';
import 'package:islamy/features/home/presentation/views/tabs/radio/widgets/radio_options.dart';
import 'widgets/radio_lists.dart';
import 'widgets/reciters_lists.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      imagePath: AppImages.radioBg,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(kDefaultPadding),
          child: BlocBuilder<RadioCubit, RadioStates>(
            builder: (context, state) {
              bool isRadioSelected = true;
              if (state is RadioSuccessState) {
                isRadioSelected = state.isRadioSelected;
              }
              return Column(
                children: [
                  const MosqueHeader(),
                  RadioOptions(
                    isRadioSelected: isRadioSelected,
                    onOptionChanged: (isSelected) {
                      RadioCubit.get(context).toggleRadioOption(isSelected);
                    },
                  ),
                  isRadioSelected ? const RadioLists() : const RecitersLists(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
