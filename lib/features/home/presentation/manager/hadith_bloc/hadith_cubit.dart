import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/hadith_model.dart';
import 'hadith_states.dart';

class HadithCubit extends Cubit<HadithStates> {
  HadithCubit() : super(HadithInitialState());

  static HadithCubit get(BuildContext context) => BlocProvider.of(context);

  Future<void> loadHadithsFile() async {
    emit(HadithDataLoadingState());

    try {
      final hadiths = await Future.wait(
        List.generate(50, (index) async {
          final int id = index + 1;
          final String content = await rootBundle.loadString(
            'assets/hadith/h$id.txt',
          );
          final List<String> lines = content.trim().split('\n');
          final String title = lines.first.trim();
          final String hadithContent = lines.skip(1).join('\n').trim();

          return HadithModel(
            title: title,
            content: hadithContent,
            hadithNumber: id,
          );
        }),
      );

      emit(HadithDataSuccessState(hadiths: hadiths));
    } catch (e) {
      emit(HadithDataErrorState(errorMessage: 'Error loading hadiths'));
    }
  }
}
