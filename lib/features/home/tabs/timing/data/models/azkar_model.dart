import 'package:equatable/equatable.dart';

class AzkarModel extends Equatable {
  final List<AzkarCategory> categories;

  const AzkarModel({required this.categories});

  factory AzkarModel.fromJson(Map<String, dynamic> json) {
    return AzkarModel(
      categories: (json['categories'] as List)
          .map((category) => AzkarCategory.fromJson(category))
          .toList(),
    );
  }

  @override
  List<Object?> get props => [categories];
}

class AzkarCategory extends Equatable {
  final String name;
  final List<AzkarItem> items;

  const AzkarCategory({required this.name, required this.items});

  factory AzkarCategory.fromJson(Map<String, dynamic> json) {
    return AzkarCategory(
      name: json['name'],
      items: (json['items'] as List)
          .map((item) => AzkarItem.fromJson(item))
          .toList(),
    );
  }

  @override
  List<Object?> get props => [name, items];
}

class AzkarItem extends Equatable {
  final String content;
  final String count;

  const AzkarItem({required this.content, required this.count});

  factory AzkarItem.fromJson(Map<String, dynamic> json) {
    return AzkarItem(content: json['content'], count: json['count']);
  }

  @override
  List<Object?> get props => [content, count];
}



