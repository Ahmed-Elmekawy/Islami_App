import 'package:flutter/material.dart';
import 'package:islamy/core/constants.dart';
import 'package:islamy/core/utils/app_assets.dart';
import 'package:islamy/core/widgets/custom_background.dart';
import 'package:islamy/core/widgets/mosque_header.dart';
import 'widgets/custom_search_bar.dart';
import 'widgets/most_recently.dart';
import 'widgets/suras_list.dart';

class QuranTab extends StatelessWidget {
  const QuranTab({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      imagePath: AppImages.quranBg,
      child: const SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(kDefaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                MosqueHeader(),
                CustomSearchBar(),
                MostRecently(),
                SurasList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
