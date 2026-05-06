import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamy/features/home/tabs/quran/data/models/sura_model.dart';
import 'package:islamy/features/surah_details/view_model/bloc/sura_details_bloc.dart';
import 'package:islamy/features/surah_details/view_model/bloc/sura_details_event.dart';
import 'package:islamy/features/surah_details/views/widgets/sura_pages.dart';
import '../../../../core/di/injection_container.dart';
import '../../../../core/widgets/mosque_footer.dart';

class SuraDetailsView extends StatelessWidget {
  const SuraDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    SuraModel suraModel =
        ModalRoute.of(context)!.settings.arguments as SuraModel;
    return BlocProvider(
      create: (context) => sl<SuraDetailsBloc>()..add(LoadSuraContentEvent(suraModel: suraModel)),
      child: Scaffold(
        appBar: AppBar(title: Text(suraModel.nameEnglish)),
        body: SafeArea(
          child: Stack(
            children: [
              Align(alignment: Alignment.bottomCenter, child: MosqueFooter()),
              SuraPages(suraModel: suraModel),
            ],
          ),
        ),
      ),
    );
  }
}


