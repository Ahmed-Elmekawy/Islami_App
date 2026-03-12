import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamy/features/home/data/suras_data.dart';
import 'package:islamy/features/home/presentation/manager/radio_bloc/radio_states.dart';
import 'package:just_audio/just_audio.dart';
import '../../../../../core/networking/dio_helper.dart';
import '../../../data/models/radio_model.dart';
import '../../../data/models/reciters_model.dart';

class RadioCubit extends Cubit<RadioStates> {
  String? currentUrl;
  List<RadioModel> radios = [];
  List<ReciterModel> reciters = [];
  final AudioPlayer audioPlayer = AudioPlayer();

  RadioCubit() : super(RadioInitialState()) {
    audioPlayer.playerStateStream.listen((playerState) {
      if (playerState.processingState == ProcessingState.completed) {
        currentUrl = null;
        emit(RadioSuccessState(radios: radios, reciters: reciters));
      }
    });
  }

  static RadioCubit get(BuildContext context) => BlocProvider.of(context);

  Future<void> getRadiosAndReciters() async {
    emit(RadioLoadingState());
    try {
      await Future.wait([_getRadios(), _getReciters()]);
      emit(RadioSuccessState(radios: radios, reciters: reciters));
    } catch (e) {
      emit(RadioErrorState(errorMessage: e.toString()));
    }
  }

  Future<void> _getRadios() async {
    final response = await DioHelper.getData(
      methodUrl: 'https://www.mp3quran.net/api/v3/radios',
    );
    radios = RadioResponse.fromJson(response.data).radios;
  }

  Future<void> _getReciters() async {
    final response = await DioHelper.getData(
      methodUrl: 'https://www.mp3quran.net/api/v3/reciters',
    );
    reciters = RecitersResponse.fromJson(response.data).reciters;
  }

  Future<void> playRadio(String url) async {
    emit(RadioLoadingState());
    try {
      if (currentUrl == url) {
        await stopAudio();
      } else {
        if (audioPlayer.playing) await audioPlayer.stop();
        await audioPlayer.setUrl(url);
        audioPlayer.play();
        currentUrl = url;
        emit(RadioSuccessState(radios: radios, reciters: reciters));
      }
    } catch (e) {
      emit(RadioErrorState(errorMessage: "Could not play radio"));
    }
  }

  Future<void> stopAudio() async {
    await audioPlayer.stop();
    currentUrl = null;
    emit(RadioSuccessState(radios: radios, reciters: reciters));
  }

  bool isPlaying(String url) => currentUrl == url;

  bool get isMuted => audioPlayer.volume == 0;

  void toggleMute() {
    audioPlayer.setVolume(isMuted ? 1 : 0);
    emit(RadioSuccessState(radios: radios, reciters: reciters));
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
}
