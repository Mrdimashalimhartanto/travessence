part of 'widgets.dart';

class AtraksiCard extends StatelessWidget {
  final AtraksiModel atraksi;
  const AtraksiCard({super.key, required this.atraksi});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      height: 330,
      width: 370,
      decoration: BoxDecoration(
        color: travessence5,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
            child: CarouselSlider(
              options: CarouselOptions(
                height: 180,
                viewportFraction: 1,
                enableInfiniteScroll: true,
                autoPlay: false,
                autoPlayInterval: const Duration(seconds: 4),
              ),
              items: atraksi.image.map((imageUrl) {
                return Image.network(
                  imageUrl, // ✅ INI YANG BENAR
                  width: double.infinity,
                  fit: BoxFit.cover,
                );
              }).toList(),
            ),
          ),

          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              atraksi.name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.poppins(
                color: travessence,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
          SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              atraksi.location,
              style: GoogleFonts.poppins(fontSize: 12),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Image.asset(atraksi.icon, height: 12),
              ),
              SizedBox(width: 4),
              Text(
                '${atraksi.rating}/5',
                // '4,3/5 (15rb Review) * 636RB+ dipesan',
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              atraksi.detailLocation,
              style: GoogleFonts.poppins(fontSize: 12),
            ),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  'Pesan tiket untuk hari ini',
                  // 'asdsad' price.toUpperCase(),
                  style: GoogleFonts.poppins(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
              SizedBox(width: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  atraksi.price,
                  // 'asdsad' price.toUpperCase(),
                  style: GoogleFonts.poppins(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 19,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
