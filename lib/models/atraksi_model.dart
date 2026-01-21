part of 'models.dart';

class AtraksiModel {
  final String id;
  final String name;
  final String location;
  final String city;
  final String description;
  final DateTime startDate;
  final DateTime endDate;
  final String openingTime;
  final String closingTime;
  final String price;
  final String category;
  final String imageUrl;

  AtraksiModel({
    required this.id,
    required this.name,
    required this.location,
    required this.city,
    required this.description,
    required this.startDate,
    required this.endDate,
    required this.openingTime,
    required this.closingTime,
    required this.price,
    required this.category,
    required this.imageUrl,
  });
}
