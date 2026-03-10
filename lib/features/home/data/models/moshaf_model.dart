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
