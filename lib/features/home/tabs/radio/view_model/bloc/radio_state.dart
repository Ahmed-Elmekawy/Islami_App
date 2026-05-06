import 'package:equatable/equatable.dart';
import '../../data/models/radio_model.dart';
import '../../data/models/reciter_model.dart';

abstract class RadioState extends Equatable {
  const RadioState();

  @override
  List<Object?> get props => [];
}

class RadioInitial extends RadioState {}

class RadioLoading extends RadioState {}

class RadioLoaded extends RadioState {
  final List<RadioModel> radios;
  final List<ReciterModel> reciters;
  final bool isRadioSelected;
  final String? currentlyPlayingUrl;
  final bool isMuted;

  const RadioLoaded({
    required this.radios,
    required this.reciters,
    this.isRadioSelected = true,
    this.currentlyPlayingUrl,
    this.isMuted = false,
  });

  RadioLoaded copyWith({
    List<RadioModel>? radios,
    List<ReciterModel>? reciters,
    bool? isRadioSelected,
    String? currentlyPlayingUrl,
    bool? isMuted,
    bool clearUrl = false,
  }) {
    return RadioLoaded(
      radios: radios ?? this.radios,
      reciters: reciters ?? this.reciters,
      isRadioSelected: isRadioSelected ?? this.isRadioSelected,
      isMuted: isMuted ?? this.isMuted,
      currentlyPlayingUrl: clearUrl ? null : (currentlyPlayingUrl ?? this.currentlyPlayingUrl),
    );
  }

  @override
  List<Object?> get props => [radios, reciters, isRadioSelected, currentlyPlayingUrl, isMuted];
}

class RadioError extends RadioState {
  final String message;
  const RadioError(this.message);

  @override
  List<Object?> get props => [message];
}



