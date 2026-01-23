part of 'widgets.dart';

class ExploreYogyakartaSection extends StatelessWidget {
  const ExploreYogyakartaSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// HEADER
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Telusuri Yogyakarta lebih jauh',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF003580),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                child: const Text('See all'),
              ),
            ],
          ),

          const SizedBox(height: 8),

          /// SUBTITLE
          const Text(
            'Enter your details below to create your account and get started',
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),

          const SizedBox(height: 20),

          /// CARD LIST
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: wisataList.map((item) {
                return Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: WisataCard(wisata: item),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
