import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamy/core/constants.dart';
import 'package:islamy/core/widgets/custom_header.dart';
import '../../../../core/widgets/mosque_footer.dart';
import 'package:islamy/features/home/tabs/hadith/data/models/hadith_model.dart';
import '../widgets/hadith_details_content.dart';
import '../../view_model/bloc/hadith_details_bloc.dart';
import '../../view_model/bloc/hadith_details_event.dart';
import '../../view_model/bloc/hadith_details_state.dart';

class HadithDetailsView extends StatelessWidget {
  const HadithDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final hadith = ModalRoute.of(context)!.settings.arguments as HadithModel;
    return BlocProvider(
      create: (context) => HadithDetailsBloc()..add(LoadHadithDetailsEvent(hadith)),
      child: BlocBuilder<HadithDetailsBloc, HadithDetailsState>(
        builder: (context, state) {
          if (state is HadithDetailsLoaded) {
            return Scaffold(
              appBar: AppBar(title: Text("Hadith ${state.hadith.hadithNumber}")),
              body: SafeArea(
                child: Stack(
                  children: [
                    Align(alignment: Alignment.bottomCenter, child: MosqueFooter()),
                    Padding(
                      padding: const EdgeInsets.only(bottom: kDefaultPadding),
                      child: Column(
                        children: [
                          CustomHeader(title: state.hadith.title),
                          HadithDetailsContent(hadith: state.hadith),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          return const Scaffold(body: Center(child: CircularProgressIndicator()));
        },
      ),
    );
  }
}
