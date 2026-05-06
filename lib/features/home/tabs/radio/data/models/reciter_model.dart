import 'package:equatable/equatable.dart';

class ReciterModel extends Equatable {
  final int id;
  final String name;
  final String? letter;
  final DateTime? date;
  final List<MoshafModel> moshaf;

  const ReciterModel({
    required this.id,
    required this.name,
    this.letter,
    this.date,
    required this.moshaf,
  });

  String? get defaultUrl {
    if (moshaf.isNotEmpty) {
      final server = moshaf[0].server;
      return server.endsWith('/') ? '${server}001.mp3' : '$server/001.mp3';
    }
    return null;
  }

  factory ReciterModel.fromJson(Map<String, dynamic> json) {
    return ReciterModel(
      id: json['id'],
      name: json['name'],
      letter: json['letter'],
      date: json['date'] != null ? DateTime.parse(json['date']) : null,
      moshaf: (json['moshaf'] as List?)
              ?.map((e) => MoshafModel.fromJson(e))
              .toList() ??
          [],
    );
  }

  @override
  List<Object?> get props => [id, name, letter, date, moshaf];
}

class MoshafModel extends Equatable {
  final int id;
  final String name;
  final String server;
  final int surahTotal;
  final List<String> surahList;

  const MoshafModel({
    required this.id,
    required this.name,
    required this.server,
    required this.surahTotal,
    required this.surahList,
  });

  factory MoshafModel.fromJson(Map<String, dynamic> json) {
    return MoshafModel(
      id: json['id'],
      name: json['name'],
      server: json['server'],
      surahTotal: json['surah_total'],
      surahList: json['surah_list']?.toString().split(',') ?? [],
    );
  }

  @override
  List<Object?> get props => [id, name, server, surahTotal, surahList];
}



