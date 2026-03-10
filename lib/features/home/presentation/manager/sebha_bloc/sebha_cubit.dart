import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'sebha_states.dart';

class SebhaCubit extends Cubit<SebhaStates> {
  SebhaCubit() : super(SebhaInitialState());

  static SebhaCubit get(BuildContext context) => BlocProvider.of(context);

  int counter = 0;
  double angle = 0;
  int index = 0;
  final List<String> azkar = [
    "سبحان الله",
    "الحمد لله",
    "الله أكبر",
    "لا إله إلا الله",
  ];

  void onSebhaClick() {
    counter++;
    angle += (1 / 30);
    if (counter == 33) {
      index = (index + 1) % azkar.length;
      counter = 0;
    }
    emit(SebhaCounterChangeState());
  }
}
