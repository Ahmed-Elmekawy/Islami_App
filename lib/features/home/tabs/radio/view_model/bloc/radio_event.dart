import 'package:equatable/equatable.dart';

abstract class RadioEvent extends Equatable {
  const RadioEvent();

  @override
  List<Object?> get props => [];
}

class FetchRadiosAndRecitersEvent extends RadioEvent {}

class PlayAudioEvent extends RadioEvent {
  final String url;
  const PlayAudioEvent(this.url);

  @override
  List<Object?> get props => [url];
}

class StopAudioEvent extends RadioEvent {}

class ToggleMuteEvent extends RadioEvent {}

class ToggleTabEvent extends RadioEvent {
  final bool isRadioSelected;
  const ToggleTabEvent(this.isRadioSelected);

  @override
  List<Object?> get props => [isRadioSelected];
}



