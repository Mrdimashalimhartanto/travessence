part of 'widgets.dart';

class DestinationPopularSection extends StatelessWidget {
  const DestinationPopularSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        DestinationCard(
          image: "https://images.unsplash.com/photo-1501785888041-af3ef285b470",
        ),
        SizedBox(height: 16),
        DestinationCard(
          image: "https://images.unsplash.com/photo-1469474968028-56623f02e42e",
        ),
      ],
    );
  }
}

class DestinationCard extends StatelessWidget {
  final String image;

  const DestinationCard({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              image,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 12,
            left: 12,
            right: 12,
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Bromo Tengger Semeru",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "Probolinggo, East Java",
                        style: GoogleFonts.poppins(
                          fontSize: 11,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "Rp. 1.560.000 / trip",
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
