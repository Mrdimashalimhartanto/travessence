part of 'widgets.dart';

class PopularDestinationGrid extends StatelessWidget {
  const PopularDestinationGrid({super.key});

  static const double _itemHeight = 80; // ⬅️ samain dgn tinggi header

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          mainAxisExtent: _itemHeight, // ✅ HEIGHT FIX
        ),
        itemCount: 4,
        itemBuilder: (context, index) {
          final items = [
            {
              "title": "Bali",
              "image":
                  "https://images.unsplash.com/photo-1507525428034-b723cf961d3e",
            },
            {
              "title": "Yogyakarta",
              "image":
                  "https://plus.unsplash.com/premium_photo-1700954824012-08ce5362e6c6",
            },
            {
              "title": "Bandung",
              "image":
                  "https://images.unsplash.com/photo-1523413651479-597eb2da0ad6",
            },
            {
              "title": "Jakarta",
              "image":
                  "https://images.unsplash.com/photo-1505576391880-b3f9d713dc4f",
            },
          ];

          return GridCard(
            title: items[index]["title"]!,
            image: items[index]["image"]!,
          );
        },
      ),
    );
  }
}

class GridCard extends StatelessWidget {
  final String title;
  final String image;

  const GridCard({super.key, required this.title, required this.image});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(image, fit: BoxFit.cover),
          Container(
            decoration: BoxDecoration(color: Colors.black.withOpacity(0.45)),
          ),
          Center(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 15, // ⬅️ biar balance sama header
              ),
            ),
          ),
        ],
      ),
    );
  }
}
