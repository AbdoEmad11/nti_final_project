class CategoryModel {
  final String id;
  final String name;
  final String description;
  final String coverPictureUrl;

  CategoryModel({
    required this.id,
    required this.name,
    required this.description,
    required this.coverPictureUrl,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id']?.toString() ?? '',
      name: json['name']?.toString() ?? 'Category',
      description: json['description']?.toString() ?? '',
      coverPictureUrl: json['coverPictureUrl']?.toString() ??
          json['coverUrl']?.toString() ??
          json['imageUrl']?.toString() ??
          '',
    );
  }
}