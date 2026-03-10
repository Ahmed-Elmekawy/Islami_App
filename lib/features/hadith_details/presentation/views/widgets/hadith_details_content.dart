import 'package:flutter/material.dart';

import '../../../../../core/constants.dart';
import '../../../../home/data/models/hadith_model.dart';

class HadithDetailsContent extends StatelessWidget {
  const HadithDetailsContent({super.key, required this.hadith});

  final HadithModel hadith;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: kDefaultPadding,),
        child: Text(
          hadith.content,
          textAlign: TextAlign.center,
          textDirection: TextDirection.rtl,
          style: Theme.of(
            context,
          ).textTheme.titleMedium?.copyWith(height: 2.2, wordSpacing: 2),
        ),
      ),
    );
  }
}
