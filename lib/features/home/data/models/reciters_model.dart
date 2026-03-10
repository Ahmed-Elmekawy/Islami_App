class RecitersResponse {
  final List<ReciterModel> reciters;

  RecitersResponse({required this.reciters});

  factory RecitersResponse.fromJson(Map<String, dynamic> json) {
    return RecitersResponse(
      reciters: (json['reciters'] as List)
          .map((r) => ReciterModel.fromJson(r))
          .toList(),
    );
  }
}

class ReciterModel {
  final int id;
  final String name;
  final String letter;
  final DateTime date;
  final List<MoshafModel> moshaf;

  ReciterModel({
    required this.id,
    required this.name,
    required this.letter,
    required this.date,
    required this.moshaf,
  });

  factory ReciterModel.fromJson(Map<String, dynamic> json) {
    return ReciterModel(
      id: json['id'],
      name: json['name'],
      letter: json['letter'],
      date: DateTime.parse(json['date']),
      moshaf: (json['moshaf'] as List)
          .map((m) => MoshafModel.fromJson(m))
          .toList(),
    );
  }
}

class MoshafModel {
  final int id;
  final String name;
  final String server;
  final int surahTotal;
  final int moshafType;
  final List<String> surahList;

  MoshafModel({
    required this.id,
    required this.name,
    required this.server,
    required this.surahTotal,
    required this.moshafType,
    required this.surahList,
  });

  factory MoshafModel.fromJson(Map<String, dynamic> json) {
    List<String> parseSurahList(String list) {
      return list.split(',').map((e) {
        int surahNumber = int.parse(e.trim());
        return surahNumber.toString().padLeft(3, '0');
      }).toList();
    }

    return MoshafModel(
      id: json['id'],
      name: json['name'],
      server: json['server'],
      surahTotal: json['surah_total'],
      moshafType: json['moshaf_type'],
      surahList: parseSurahList(json['surah_list']),
    );
  }
}
