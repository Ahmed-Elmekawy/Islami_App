import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamy/features/home/data/suras_data.dart';
import '../../../../../core/utils/shared_pref_helper.dart';
import '../../../data/models/sura_model.dart';
import 'quran_sates.dart';

class QuranCubit extends Cubit<QuranStates> {
  QuranCubit() : super(QuranInitialState());

  static QuranCubit get(BuildContext context) => BlocProvider.of(context);

  List<SuraModel> filteredSuras = [];
  List<SuraModel> recentSuras = [];
  List<String> mostRecentSurasNumbers = [];
  final TextEditingController searchController = TextEditingController();

  void loadQuranData() {
    emit(QuranDataLoadingState());
    try {
      _loadSurasList();
      _loadMostRecently();
      _emitQuranDataSuccessState();
    } catch (e) {
      emit(QuranDataErrorState(errorMessage: 'Error loading suras'));
    }
  }

  void _loadSurasList() {
    filteredSuras = quranSurasList;
  }

  void loadFilteredSuras(String searchText) {
    if (searchText.isEmpty) {
      _loadSurasList();
      return;
    }
    filteredSuras = quranSurasList
        .where(
          (sura) =>
              sura.nameArabic.contains(searchText) ||
              sura.nameEnglish.toLowerCase().contains(searchText.toLowerCase()),
        )
        .toList();
    _emitQuranDataSuccessState();
  }

  void _loadMostRecently() {
    recentSuras = [];
    mostRecentSurasNumbers = SharedPrefHelper.getData('mostRecently') ?? [];
    for (var number in mostRecentSurasNumbers) {
      var foundSura = quranSurasList.firstWhere(
        (sura) => sura.suraNumber.toString() == number,
      );
      recentSuras.add(foundSura);
    }
  }

  Future<void> setMostRecentlyItem(SuraModel suraModel) async {
    try {
      String suraNumber = suraModel.suraNumber.toString();
      mostRecentSurasNumbers.remove(suraNumber);
      mostRecentSurasNumbers.insert(0, suraNumber);
      if (mostRecentSurasNumbers.length > 10) {
        mostRecentSurasNumbers = mostRecentSurasNumbers.sublist(0, 10);
      }

      await SharedPrefHelper.saveData('mostRecently', mostRecentSurasNumbers);
      emit(MostRecentlyItemSuccessState());
      loadQuranData();
      _searchClear();
    } catch (e) {
      emit(
        MostRecentlyItemErrorState(errorMessage: 'Error saving recent sura'),
      );
    }
  }

  void _emitQuranDataSuccessState() {
    emit(
      QuranDataSuccessState(
        filteredSuras: filteredSuras,
        recentSuras: recentSuras,
      ),
    );
  }

  void _searchClear() {
    searchController.clear();
    FocusManager.instance.primaryFocus?.unfocus();
  }
}
