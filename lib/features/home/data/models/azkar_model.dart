class AzkarModel {
  final List<AzkarCategory> categories;

  AzkarModel({required this.categories});

  factory AzkarModel.fromJson(Map<String, dynamic> json) {
    return AzkarModel(
      categories: (json['categories'] as List)
          .map((category) => AzkarCategory.fromJson(category))
          .toList(),
    );
  }
}

class AzkarCategory {
  final String name;
  final List<AzkarItem> items;

  AzkarCategory({required this.name, required this.items});

  factory AzkarCategory.fromJson(Map<String, dynamic> json) {
    return AzkarCategory(
      name: json['name'],
      items: (json['items'] as List)
          .map((item) => AzkarItem.fromJson(item))
          .toList(),
    );
  }
}

class AzkarItem {
  final String content;
  final String count;

  AzkarItem({required this.content, required this.count});

  factory AzkarItem.fromJson(Map<String, dynamic> json) {
    return AzkarItem(content: json['content'], count: json['count']);
  }
}
