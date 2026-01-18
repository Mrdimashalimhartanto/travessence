part of 'widgets.dart';

class RecommendedFoodSection extends StatelessWidget {
  const RecommendedFoodSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(left: 16),
        children: const [
          FoodCard(
            image: "https://images.unsplash.com/photo-1546069901-ba9599a7e63c",
            title: "Mie Ayam Bakso Pak Aji",
            info: "2.3 km • 23 minutes delivery",
          ),
          FoodCard(
            image: "https://images.unsplash.com/photo-1551218808-94e220e084d2",
            title: "Seafood Ayu",
            info: "4.45 km • 40 minutes delivery",
          ),
        ],
      ),
    );
  }
}

class FoodCard extends StatelessWidget {
  final String image;
  final String title;
  final String info;

  const FoodCard({
    super.key,
    required this.image,
    required this.title,
    required this.info,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(image: NetworkImage(image), fit: BoxFit.cover),
      ),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [Colors.black.withOpacity(0.6), Colors.transparent],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              info,
              style: GoogleFonts.poppins(color: Colors.white70, fontSize: 11),
            ),
          ],
        ),
      ),
    );
  }
}
