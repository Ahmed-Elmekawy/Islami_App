import 'package:flutter_bloc/flutter_bloc.dart';
import 'sebha_event.dart';
import 'sebha_state.dart';

class SebhaBloc extends Bloc<SebhaEvent, SebhaState> {
  int _counter = 0;
  double _angle = 0;
  int _index = 0;
  final List<String> _azkar = [
    "سبحان الله",
    "الحمد لله",
    "الله أكبر",
    "لا إله إلا الله",
  ];

  SebhaBloc() : super(const SebhaUpdateState(counter: 0, angle: 0, currentZikr: "سبحان الله")) {
    on<SebhaClickedEvent>(_onSebhaClick);
  }

  void _onSebhaClick(SebhaClickedEvent event, Emitter<SebhaState> emit) {
    _counter++;
    _angle += (1 / 30);
    
    if (_counter == 33) {
      _index = (_index + 1) % _azkar.length;
      _counter = 0;
    }
    
    emit(SebhaUpdateState(
      counter: _counter,
      angle: _angle,
      currentZikr: _azkar[_index],
    ));
  }
}



