part of 'models.dart';

final List<PesawatModel> pesawatData = [
  PesawatModel(
    airline: 'Garuda Indonesia',
    flightNumber: 'GA123',
    departureCity: 'Jakarta (JKTC)',
    arrivalCity: 'Bali (DPS)',
    departureTime: DateTime(2024, 7, 20, 10, 0),
    arrivalTime: DateTime(2024, 7, 20, 12, 30),
    flightClass: 'Economy',
    price: 'IDR 1,500,000',
    category: 'Domestic',
    airlineLogo:
        "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d4/2012_Citilink_Logo.svg/1280px-2012_Citilink_Logo.svg.png",
  ),
  PesawatModel(
    airline: 'Lion Air',
    flightNumber: 'JT456',
    departureCity: 'Jakarta (JKTC)',
    arrivalCity: 'Surabaya (SUB)',
    departureTime: DateTime(2024, 7, 21, 14, 0),
    arrivalTime: DateTime(2024, 7, 21, 15, 30),
    flightClass: 'Business',
    price: 'IDR 2,000,000',
    category: 'Domestic',
    airlineLogo:
        "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d4/2012_Citilink_Logo.svg/1280px-2012_Citilink_Logo.svg.png",
  ),
];
