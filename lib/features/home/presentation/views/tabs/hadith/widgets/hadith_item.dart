import 'package:flutter/material.dart';
import 'package:islamy/core/utils/app_routes.dart';
import '../../../../../../../core/widgets/mosque_footer.dart';
import '../../../../../data/models/hadith_model.dart';
import 'hadith_content.dart';
import 'hadith_header.dart';
import 'hadith_item_bg.dart';

class HadithItem extends StatelessWidget {
  final HadithModel hadith;
  const HadithItem({super.key, required this.hadith});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          AppRoutes.hadithDetails,
          arguments: hadith,
        );
      },
      child: HadithItemBg(
        child: Column(
          children: [
            HadithHeader(title: hadith.title),
            HadithContent(content: hadith.content),
            MosqueFooter(),
          ],
        ),
      ),
    );
  }
}
