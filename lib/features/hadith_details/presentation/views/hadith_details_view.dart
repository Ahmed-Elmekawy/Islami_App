import 'package:flutter/material.dart';
import 'package:islamy/core/constants.dart';
import 'package:islamy/core/widgets/custom_header.dart';
import '../../../../core/widgets/mosque_footer.dart';
import '../../../home/data/models/hadith_model.dart';
import 'widgets/hadith_details_content.dart';

class HadithDetailsView extends StatefulWidget {
  const HadithDetailsView({super.key});

  @override
  State<HadithDetailsView> createState() => _HadithDetailsViewState();
}

class _HadithDetailsViewState extends State<HadithDetailsView> {
  late HadithModel hadith;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    hadith = ModalRoute.of(context)!.settings.arguments as HadithModel;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hadith ${hadith.hadithNumber}")),
      body: SafeArea(
        child: Stack(
          children: [
            Align(alignment: Alignment.bottomCenter, child: MosqueFooter()),
            Padding(
              padding: const EdgeInsets.only(bottom: kDefaultPadding),
              child: Column(
                children: [
                  CustomHeader(title: hadith.title),
                  HadithDetailsContent(hadith: hadith),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

