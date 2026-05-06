import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:islamy/features/home/tabs/quran/data/suras_data.dart';
import '../../data/repositories/radio_repository.dart';
import 'radio_event.dart';
import 'radio_state.dart';

class RadioBloc extends Bloc<RadioEvent, RadioState> {
  final RadioRepository repository;
  final AudioPlayer _audioPlayer = AudioPlayer();

  RadioBloc({required this.repository}) : super(RadioInitial()) {
    on<FetchRadiosAndRecitersEvent>(_onFetchData);
    on<ToggleTabEvent>(_onToggleTab);
    on<PlayAudioEvent>(_onPlayAudio);
    on<StopAudioEvent>(_onStopAudio);
    on<ToggleMuteEvent>(_onToggleMute);

    _audioPlayer.playerStateStream.listen((playerState) {
      if (playerState.processingState == ProcessingState.completed) {
        add(StopAudioEvent());
      }
    });
  }

  Future<void> _onFetchData(FetchRadiosAndRecitersEvent event, Emitter<RadioState> emit) async {
    emit(RadioLoading());

    final radiosResult = await repository.getRadios();
    final recitersResult = await repository.getReciters();

    radiosResult.fold(
      (failure) => emit(RadioError(failure.message)),
      (radios) {
        recitersResult.fold(
          (failure) => emit(RadioError(failure.message)),
          (reciters) => emit(RadioLoaded(radios: radios, reciters: reciters)),
        );
      },
    );
  }

  void _onToggleTab(ToggleTabEvent event, Emitter<RadioState> emit) {
    if (state is RadioLoaded) {
      final currentState = state as RadioLoaded;
      emit(currentState.copyWith(isRadioSelected: event.isRadioSelected));
    }
  }

  Future<void> _onPlayAudio(PlayAudioEvent event, Emitter<RadioState> emit) async {
    if (state is RadioLoaded) {
      final currentState = state as RadioLoaded;
      
      try {
        if (_audioPlayer.playing) await _audioPlayer.stop();
        await _audioPlayer.setUrl(event.url);
        _audioPlayer.play();
        emit(currentState.copyWith(currentlyPlayingUrl: event.url));
      } catch (e) {
        emit(const RadioError("Failed to play audio"));
      }
    }
  }

  Future<void> _onStopAudio(StopAudioEvent event, Emitter<RadioState> emit) async {
    if (state is RadioLoaded) {
      await _audioPlayer.stop();
      emit((state as RadioLoaded).copyWith(clearUrl: true));
    }
  }

  void _onToggleMute(ToggleMuteEvent event, Emitter<RadioState> emit) {
    if (state is RadioLoaded) {
      final currentState = state as RadioLoaded;
      final newMuteStatus = !currentState.isMuted;
      _audioPlayer.setVolume(newMuteStatus ? 0 : 1);
      emit(currentState.copyWith(isMuted: newMuteStatus));
    }
  }

  String getSuraUrl(String server, String suraIndex) {
    if (server.endsWith('/')) {
      return "$server$suraIndex.mp3";
    }
    return "$server/$suraIndex.mp3";
  }

  String getSuraName(String suraIndex) {
    int index = int.parse(suraIndex) - 1;
    return quranSurasList[index].nameArabic;
  }

  bool isPlaying(String url) {
    if (state is RadioLoaded) {
      return (state as RadioLoaded).currentlyPlayingUrl == url;
    }
    return false;
  }

  bool get isMuted {
    if (state is RadioLoaded) {
      return (state as RadioLoaded).isMuted;
    }
    return false;
  }

  @override
  Future<void> close() {
    _audioPlayer.dispose();
    return super.close();
  }
}


