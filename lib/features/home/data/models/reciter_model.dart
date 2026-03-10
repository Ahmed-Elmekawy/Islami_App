import 'moshaf_model.dart';

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

class ReciterResponse {
  final List<ReciterModel> reciters;

  ReciterResponse({required this.reciters});

  factory ReciterResponse.fromJson(Map<String, dynamic> json) {
    return ReciterResponse(
      reciters: (json['reciters'] as List)
          .map((r) => ReciterModel.fromJson(r))
          .toList(),
    );
  }
}
