part of 'models.dart';

class PesawatModel {
  final String airline;
  final String flightNumber;
  final String departureCity;
  final String arrivalCity;
  final DateTime departureTime;
  final DateTime arrivalTime;
  final String flightClass;
  final String price;
  final String category;
  final String airlineLogo;

  PesawatModel({
    required this.airline,
    required this.flightNumber,
    required this.departureCity,
    required this.arrivalCity,
    required this.departureTime,
    required this.arrivalTime,
    required this.flightClass,
    required this.price,
    required this.category,
    required this.airlineLogo,
  });
}
