part of 'models.dart';

// Pesawat Model
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

// Data Pesawat
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

// Promo Model
class PromoModel {
  final String image;
  final String title;
  final String date;
  final String airlineLogo;
  final String flightClass;
  final String price;
  final String category;

  PromoModel({
    required this.image,
    required this.title,
    required this.date,
    required this.airlineLogo,
    required this.flightClass,
    required this.price,
    required this.category,
  });
}

// Pilih Penerbangan
class PilihPenerbanganModel {
  final String image;
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

  PilihPenerbanganModel({
    required this.image,
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

// Data Pilihan Penerbangan
final List<PilihPenerbanganModel> pilihpenerbanganList = [
  PilihPenerbanganModel(
    image: 'https://images.unsplash.com/photo-1528265417219-1a288ae08573',
    airline: 'Sriwijaya Air',
    flightNumber: 'SRJ-AIR22034945',
    departureCity: 'Jakarta (JKTC)',
    arrivalCity: 'Jakarta → Bali',
    departureTime: DateTime(2024, 7, 20, 10, 0),
    arrivalTime: DateTime(2024, 7, 20, 12, 30),
    flightClass: 'Economy',
    price: 'IDR 800.000',
    category: 'Sriwijaya Air',
    airlineLogo:
        "https://upload.wikimedia.org/wikipedia/commons/f/f4/Sriwijaya_air.png",
  ),
  PilihPenerbanganModel(
    image:
        'https://images.unsplash.com/photo-1598675551183-1b091d43f99f?q=80&w=3092&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    airline: 'Sriwijaya Air',
    flightNumber: 'SRJ-AIR22034945',
    departureCity: 'Jakarta (JKTC)',
    arrivalCity: 'Jakarta → Palembang',
    departureTime: DateTime(2024, 7, 20, 10, 0),
    arrivalTime: DateTime(2024, 7, 20, 12, 30),
    flightClass: 'Economy',
    price: 'IDR 1,500,000',
    category: 'Sriwijaya Air',
    airlineLogo:
        "https://upload.wikimedia.org/wikipedia/commons/f/f4/Sriwijaya_air.png",
  ),
  PilihPenerbanganModel(
    image:
        'https://www.indonesia.travel/contentassets/fdb54c16421f4ecdab7735ace3e694f1/7-amazing-places-you-need-to-visit-in-banjarmasin.jpg',
    airline: 'Sriwijaya Air',
    flightNumber: 'SRJ-AIR22034945',
    departureCity: 'Jakarta (JKTC)',
    arrivalCity: 'Makasar → Banjarmasin',
    departureTime: DateTime(2024, 7, 20, 10, 0),
    arrivalTime: DateTime(2024, 7, 20, 12, 30),
    flightClass: 'Economy',
    price: 'IDR 2,340,000',
    category: 'Sriwijaya Air',
    airlineLogo:
        "https://upload.wikimedia.org/wikipedia/commons/f/f4/Sriwijaya_air.png",
  ),
  PilihPenerbanganModel(
    image:
        'https://www.indonesia.travel/contentassets/fdb54c16421f4ecdab7735ace3e694f1/7-amazing-places-you-need-to-visit-in-banjarmasin.jpg',
    airline: 'Garuda Indonesia',
    flightNumber: 'GI-AIR22034945',
    departureCity: 'Jakarta (JKTC)',
    arrivalCity: 'Yogyakarta → Surabaya',
    departureTime: DateTime(2024, 7, 20, 10, 0),
    arrivalTime: DateTime(2024, 7, 20, 12, 30),
    flightClass: 'Economy',
    price: 'IDR 780.000',
    category: 'Garuda Indonesia',
    airlineLogo:
        "https://upload.wikimedia.org/wikipedia/en/thumb/f/fe/Garuda_Indonesia_Logo.svg/1200px-Garuda_Indonesia_Logo.svg.png",
  ),
];

// data list pesawat
final List<String> penerbanganList = const [
  'Sriwijaya Air',
  'Garuda Indonesia',
  'AirAsia',
  'Lion Air',
  'Citilink',
  'Batik Air',
  'Nam Air',
  'Wings Air',
  'TransNusa',
  'Pelita Air',
  'Trigana Air',
];

// Promo Data
final List<PromoModel> promoList = [
  PromoModel(
    image: "https://images.unsplash.com/photo-1528265417219-1a288ae08573",
    title: "Amora Ubud Boutique Villa",
    date: "25 Maret 2023",
    airlineLogo:
        "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d4/2012_Citilink_Logo.svg/1280px-2012_Citilink_Logo.svg.png",
    flightClass: "Ekonomi",
    price: "IDR 2.709.661",
    category: "Hotel",
  ),
  PromoModel(
    image:
        "https://images.unsplash.com/photo-1612528910408-9c35cf5a6244?q=80&w=1740&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    title: "The Kayon Jungle Resort",
    date: "12 April 2023",
    airlineLogo:
        "https://upload.wikimedia.org/wikipedia/en/thumb/f/fe/Garuda_Indonesia_Logo.svg/1200px-Garuda_Indonesia_Logo.svg.png",
    flightClass: "Bisnis",
    price: "IDR 3.950.000",
    category: "Pesawat",
  ),
  PromoModel(
    image: "https://images.unsplash.com/photo-1566073771259-6a8506099945",
    title: "Maya Ubud Resort",
    date: "8 Mei 2023",
    airlineLogo:
        "https://upload.wikimedia.org/wikipedia/en/thumb/f/fe/Garuda_Indonesia_Logo.svg/1200px-Garuda_Indonesia_Logo.svg.png",
    flightClass: "Ekonomi",
    price: "IDR 2.150.000",
    category: "Villa & Apt",
  ),
  PromoModel(
    image: "https://images.unsplash.com/photo-1566073771259-6a8506099945",
    title: "Maya Ubud Resort",
    date: "8 Mei 2023",
    airlineLogo:
        "https://upload.wikimedia.org/wikipedia/en/thumb/f/fe/Garuda_Indonesia_Logo.svg/1200px-Garuda_Indonesia_Logo.svg.png",
    flightClass: "Ekonomi",
    price: "IDR 2.150.000",
    category: "To Do",
  ),
  PromoModel(
    image: "https://images.unsplash.com/photo-1566073771259-6a8506099945",
    title: "Maya Ubud Resort",
    date: "8 Mei 2023",
    airlineLogo:
        "https://upload.wikimedia.org/wikipedia/en/thumb/f/fe/Garuda_Indonesia_Logo.svg/1200px-Garuda_Indonesia_Logo.svg.png",
    flightClass: "Ekonomi",
    price: "IDR 2.150.000",
    category: "Kereta Api",
  ),
  PromoModel(
    image: "https://images.unsplash.com/photo-1566073771259-6a8506099945",
    title: "Maya Ubud Resort",
    date: "8 Mei 2023",
    airlineLogo:
        "https://upload.wikimedia.org/wikipedia/en/thumb/f/fe/Garuda_Indonesia_Logo.svg/1200px-Garuda_Indonesia_Logo.svg.png",
    flightClass: "Ekonomi",
    price: "IDR 2.150.000",
    category: "Sewa Mobil",
  ),
  PromoModel(
    image: "https://images.unsplash.com/photo-1566073771259-6a8506099945",
    title: "Maya Ubud Resort",
    date: "8 Mei 2023",
    airlineLogo:
        "https://upload.wikimedia.org/wikipedia/en/thumb/f/fe/Garuda_Indonesia_Logo.svg/1200px-Garuda_Indonesia_Logo.svg.png",
    flightClass: "Ekonomi",
    price: "IDR 2.150.000",
    category: "Jemputan Bandara",
  ),
];

// Wisata Model
class WisataModel {
  final String title;
  final String location;
  final String imageUrl;
  final double rating;

  WisataModel({
    required this.title,
    required this.location,
    required this.imageUrl,
    required this.rating,
  });
}

final List<WisataModel> wisataList = [
  WisataModel(
    title: 'Candi Borobudur',
    location: 'Yogyakarta, Jawa Timur',
    rating: 4.9,
    imageUrl:
        'https://images.unsplash.com/photo-1705905343745-6d901a93e946?q=80&w=3149&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  ),
  WisataModel(
    title: 'Candi Gunung Kawi',
    location: 'Yogyakarta, Jawa Timur',
    rating: 4.8,
    imageUrl:
        'https://www.indonesia.travel/contentassets/0d1516b48bb64a7aa9551bf0553d7eaa/gunung-kawi.jpeg',
  ),
];

// Hotel Model
class HotelModel {
  final String name;
  final String image;
  final double rating;
  final String location;
  final String price;

  HotelModel({
    required this.name,
    required this.image,
    required this.rating,
    required this.location,
    required this.price,
  });
}

final List<HotelModel> hotelList = [
  HotelModel(
    name: "Crystal Lotus Hotel",
    image: "https://images.unsplash.com/photo-1566073771259-6a8506099945",
    rating: 4.9,
    location: "Pasar Kembangan, Yogyakarta",
    price: "Rp 526.315 / Night",
  ),
  HotelModel(
    name: "Eastparc Hotel Yogyakarta",
    image: "https://images.unsplash.com/photo-1542314831-068cd1dbfeeb",
    rating: 4.9,
    location: "Jl. Laksda Adisucipto Km 6,5 Seturan",
    price: "Rp 2.130.000 / Night",
  ),
  HotelModel(
    name: "Yellow Star Ambarukmo Hotel",
    image:
        "https://cf.bstatic.com/xdata/images/hotel/max1024x768/702158926.jpg?k=139628a22369084f922d396be51ca0ed6ce03b023ca2e292202cc1bddc3ca6b9&o=",
    rating: 4.9,
    location: "Jl. Laksda Adisucipto No.23, Depok",
    price: "Rp 528.000 / Night",
  ),
  HotelModel(
    name: "Eastparc Hotel Yogyakarta",
    image: "https://images.unsplash.com/photo-1542314831-068cd1dbfeeb",
    rating: 4.9,
    location: "Jl. Laksda Adisucipto Km 6,5 Seturan",
    price: "Rp 2.130.000 / Night",
  ),
  HotelModel(
    name: "Yellow Star Ambarukmo Hotel",
    image:
        "https://cf.bstatic.com/xdata/images/hotel/max1024x768/702158926.jpg?k=139628a22369084f922d396be51ca0ed6ce03b023ca2e292202cc1bddc3ca6b9&o=",
    rating: 4.9,
    location: "Jl. Laksda Adisucipto No.23, Depok",
    price: "Rp 528.000 / Night",
  ),
];

// List Villa
class VillaModel {
  final String name;
  final String image;
  final double rating;
  final String location;
  final String price;
  final String category;

  VillaModel({
    required this.name,
    required this.image,
    required this.rating,
    required this.location,
    required this.price,
    required this.category,
  });
}

final List<VillaModel> villaList = [
  // Bali
  VillaModel(
    name: 'Clove Garden Hotel Bandung',
    category: 'Bali',
    image:
        'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiBIAabBxEx8YoLDnfMzN0-U7uMx7pY5N1Vp2Zc3uEJRd74GjhGSn7M-thcHkdt9k064QxmXTCKcSprRu_5KH3TTVZLotVZjifNscUBVreO4qdtZBdk-lEwOgAeMAKq38B7sPQYfXGwxqo/s640/gh+universal.jpg',
    rating: 4.9,
    location: 'Bandung, Jawa Barat',
    price: 'Rp. 2.310.000',
  ),
  VillaModel(
    name: 'Clove Garden Hotel Bandung',
    category: 'Bali',
    image:
        'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiBIAabBxEx8YoLDnfMzN0-U7uMx7pY5N1Vp2Zc3uEJRd74GjhGSn7M-thcHkdt9k064QxmXTCKcSprRu_5KH3TTVZLotVZjifNscUBVreO4qdtZBdk-lEwOgAeMAKq38B7sPQYfXGwxqo/s640/gh+universal.jpg',
    rating: 4.9,
    location: 'Bandung, Jawa Barat',
    price: 'Rp. 2.310.000',
  ),
  VillaModel(
    name: 'Clove Garden Hotel Bandung',
    category: 'Bali',
    image:
        'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiBIAabBxEx8YoLDnfMzN0-U7uMx7pY5N1Vp2Zc3uEJRd74GjhGSn7M-thcHkdt9k064QxmXTCKcSprRu_5KH3TTVZLotVZjifNscUBVreO4qdtZBdk-lEwOgAeMAKq38B7sPQYfXGwxqo/s640/gh+universal.jpg',
    rating: 4.9,
    location: 'Bandung, Jawa Barat',
    price: 'Rp. 2.310.000',
  ),
  // Bandung
  VillaModel(
    name: 'Clove Garden Hotel Bandung',
    category: 'Bandung',
    image:
        'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiBIAabBxEx8YoLDnfMzN0-U7uMx7pY5N1Vp2Zc3uEJRd74GjhGSn7M-thcHkdt9k064QxmXTCKcSprRu_5KH3TTVZLotVZjifNscUBVreO4qdtZBdk-lEwOgAeMAKq38B7sPQYfXGwxqo/s640/gh+universal.jpg',
    rating: 4.9,
    location: 'Bandung, Jawa Barat',
    price: 'Rp. 2.310.000',
  ),
  VillaModel(
    name: 'Clove Garden Hotel Bandung',
    category: 'Bandung',
    image:
        'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiBIAabBxEx8YoLDnfMzN0-U7uMx7pY5N1Vp2Zc3uEJRd74GjhGSn7M-thcHkdt9k064QxmXTCKcSprRu_5KH3TTVZLotVZjifNscUBVreO4qdtZBdk-lEwOgAeMAKq38B7sPQYfXGwxqo/s640/gh+universal.jpg',
    rating: 4.9,
    location: 'Bandung, Jawa Barat',
    price: 'Rp. 2.310.000',
  ),
  VillaModel(
    name: 'Clove Garden Hotel Bandung',
    category: 'Bandung',
    image:
        'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiBIAabBxEx8YoLDnfMzN0-U7uMx7pY5N1Vp2Zc3uEJRd74GjhGSn7M-thcHkdt9k064QxmXTCKcSprRu_5KH3TTVZLotVZjifNscUBVreO4qdtZBdk-lEwOgAeMAKq38B7sPQYfXGwxqo/s640/gh+universal.jpg',
    rating: 4.9,
    location: 'Bandung, Jawa Barat',
    price: 'Rp. 2.310.000',
  ),
];

final List<String> listVillaItems = const [
  'Bali',
  'Bandung',
  'Yogyakarta',
  'Bogor',
  'Malang',
  'Ubud',
  'Canggu',
  'Seminyak',
  'Lombok',
  'Klungkung',
];
