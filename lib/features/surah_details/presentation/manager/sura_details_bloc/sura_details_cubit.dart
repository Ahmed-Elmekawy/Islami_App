import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamy/features/home/data/models/sura_model.dart';
import 'sura_details_states.dart';

class SuraDetailsCubit extends Cubit<SuraDetailsStates> {
  SuraDetailsCubit() : super(SuraDetailsInitialState());

  Future<void> loadSuraFile(SuraModel suraModel) async {
    emit(SuraDetailsLoadingState());
    try {
      String content = await rootBundle.loadString(
        'assets/suras/${suraModel.suraNumber}.txt',
      );
      List<String> allLines = content.trim().split('\n');
      List<String> pages = [];
      String currentPageContent = "";
      int versesPerPage = 8;

      for (int i = 0; i < allLines.length; i++) {
        currentPageContent += "${allLines[i].trim()} ﴿${i + 1}﴾ ";
        if ((i + 1) % versesPerPage == 0 || i == allLines.length - 1) {
          pages.add(currentPageContent.trim());
          currentPageContent = "";
        }
      }
      emit(SuraDetailsSuccessState(suraPages: pages));
    } catch (e) {
      emit(SuraDetailsErrorState(errorMessage: "Content not available yet."));
    }
  }
}
