import 'package:flutter/material.dart';
import 'package:islamy/core/constants.dart';
import 'package:islamy/core/utils/app_assets.dart';
import 'package:islamy/core/widgets/custom_background.dart';
import 'package:islamy/core/widgets/mosque_header.dart';
import 'package:islamy/features/home/presentation/views/tabs/radio/widgets/radio_options.dart';
import 'widgets/radio_lists.dart';
import 'widgets/reciters_lists.dart';

class RadioTab extends StatefulWidget {
  const RadioTab({super.key});

  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> {
  bool isRadioSelected = true;

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      imagePath: AppImages.radioBg,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(kDefaultPadding),
          child: Column(
            children: [
              MosqueHeader(),
              RadioOptions(
                isRadioSelected: isRadioSelected,
                onOptionChanged: (isSelected) {
                  setState(() {
                    isRadioSelected = isSelected;
                  });
                },
              ),
              isRadioSelected ? const RadioLists() : const RecitersLists(),
            ],
          ),
        ),
      ),
    );
  }
}
