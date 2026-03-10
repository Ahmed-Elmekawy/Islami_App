import 'package:islamy/features/home/data/models/sura_model.dart';

class RadioModel {
  final int id;
  final String name;
  final String url;
  final String recentDate;

  RadioModel({
    required this.id,
    required this.name,
    required this.url,
    required this.recentDate,
  });

  factory RadioModel.fromJson(Map<String, dynamic> json) {
    return RadioModel(
      id: json['id'],
      name: json['name'],
      url: json['url'],
      recentDate: json['recent_date'],
    );
  }
}

class RadioResponse {
  final List<RadioModel> radios;

  RadioResponse({required this.radios});

  factory RadioResponse.fromJson(Map<String, dynamic> json) {
    return RadioResponse(
      radios: (json['radios'] as List)
          .map((radio) => RadioModel.fromJson(radio))
          .toList(),
    );
  }
}
