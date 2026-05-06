class OfferModel {
  final String id;
  final String name;
  final String description;
  final String coverUrl;
  final DateTime? createdAt;

  OfferModel({
    required this.id,
    required this.name,
    required this.description,
    required this.coverUrl,
    required this.createdAt,
  });

  factory OfferModel.fromJson(Map<String, dynamic> json) {
    return OfferModel(
      id: json['id']?.toString() ?? '',
      name: json['name']?.toString() ?? '',
      description: json['description']?.toString() ?? '',
      coverUrl: json['coverUrl']?.toString() ??
          json['coverPictureUrl']?.toString() ??
          json['imageUrl']?.toString() ??
          '',
      createdAt: DateTime.tryParse(json['createdAt']?.toString() ?? ''),
    );
  }
}