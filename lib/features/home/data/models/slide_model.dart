// lib/features/home/data/models/slide_model.dart
class SlideModel {
  final String id;
  final String photoUrl;
  final String description;

  SlideModel({
    required this.id,
    required this.photoUrl,
    required this.description,
  });

  factory SlideModel.fromJson(Map<String, dynamic> json) {
    return SlideModel(
      id: json['_id'],
      photoUrl: json['photo_url'],
      description: json['description'] ?? '',
    );
  }
}