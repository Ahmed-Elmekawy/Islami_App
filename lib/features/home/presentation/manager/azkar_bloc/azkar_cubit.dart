import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'azkar_states.dart';
import '../../../data/models/azkar_model.dart';

class AzkarCubit extends Cubit<AzkarStates> {
  AzkarCubit() : super(AzkarInitialState());

  static AzkarCubit get(BuildContext context) => BlocProvider.of(context);

  void getAzkar() async {
    emit(AzkarLoadingState());
    try {
      String jsonString = await rootBundle.loadString(
        'assets/azkar/azkar.json',
      );
      Map<String, dynamic> jsonResponse = json.decode(jsonString);
      AzkarModel azkarModel = AzkarModel.fromJson(jsonResponse);
      emit(AzkarSuccessState(categories: azkarModel.categories));
    } catch (error) {
      emit(AzkarErrorState(errorMessage: "Failed to load azkar_details data."));
    }
  }
}
