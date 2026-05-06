import 'package:equatable/equatable.dart';

class RadioModel extends Equatable {
  final int id;
  final String name;
  final String url;
  final String? recentDate;

  const RadioModel({
    required this.id,
    required this.name,
    required this.url,
    this.recentDate,
  });

  factory RadioModel.fromJson(Map<String, dynamic> json) {
    return RadioModel(
      id: json['id'],
      name: json['name'],
      url: json['url'],
      recentDate: json['recent_date'],
    );
  }

  @override
  List<Object?> get props => [id, name, url, recentDate];
}



