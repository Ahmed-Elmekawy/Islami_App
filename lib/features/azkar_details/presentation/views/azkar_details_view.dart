import 'package:flutter/material.dart';
import 'package:islamy/core/constants.dart';
import 'package:islamy/core/utils/app_assets.dart';
import 'package:islamy/core/widgets/custom_background.dart';
import 'package:islamy/features/azkar_details/presentation/views/widgets/zekr_item.dart';
import 'package:islamy/features/home/data/models/azkar_model.dart';

class AzkarDetailsView extends StatefulWidget {
  const AzkarDetailsView({super.key});

  @override
  State<AzkarDetailsView> createState() => _AzkarDetailsViewState();
}

class _AzkarDetailsViewState extends State<AzkarDetailsView> {
  late AzkarCategory azkarCategory;
  late List<int> currentCounts;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    azkarCategory = ModalRoute.of(context)!.settings.arguments as AzkarCategory;
    currentCounts = azkarCategory.items.map((e) => int.tryParse(e.count) ?? 0).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(azkarCategory.name)),
      body: CustomBackground(
        imagePath: AppImages.splashBackground, // Using hadithBg as a placeholder if no specific azkar details bg
        child: SafeArea(
          child: ListView.separated(
            padding: const EdgeInsets.all(kDefaultPadding),
            itemBuilder: (context, index) {
              return ZekrItem(
                onSelected: (isChanged) {
                  if (currentCounts[index] > 0) {
                    setState(() {
                      currentCounts[index]--;
                    });
                  }
                },
                zekr: azkarCategory.items[index].content,
                count: currentCounts[index].toString(),
                isSelected: currentCounts[index] == 0,
              );
            },
            separatorBuilder: (context, index) => const SizedBox(height: 16),
            itemCount: azkarCategory.items.length,
          ),
        ),
      ),
    );
  }
}
