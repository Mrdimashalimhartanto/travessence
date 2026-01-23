part of 'widgets.dart';

class VillaCard extends StatelessWidget {
  final VillaModel villaapt;
  const VillaCard({super.key, required this.villaapt});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      height: 380,
      width: 190,
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
            child: Image.network(
              villaapt.image,
              height: 180,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.fromLTRB(12, 10, 12, 0),
            child: Text(
              villaapt.name,
              // maxLines: 2,
              // overflow: TextOverflow.ellipsis,
              style: GoogleFonts.poppins(
                color: travessence,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(12, 6, 12, 0),
            child: Text(
              villaapt.location,
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 12,
              ),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.fromLTRB(12, 6, 12, 0),
          //   child: Text(
          //     villaapt.rating,
          //     style: GoogleFonts.poppins(
          //       fontSize: 11,
          //       color: Colors.black54,
          //       fontWeight: FontWeight.w500,
          //     ),
          //   ),
          // ),
          SizedBox(height: 8),
          // Padding(
          //   padding: EdgeInsets.symmetric(horizontal: 8),
          //   child: Text(villaapt.departureCity),
          // ),
          const SizedBox(height: 12),
          // Padding(
          //   padding: EdgeInsets.symmetric(horizontal: 8),
          //   child: Image.network(villaapt.airlineLogo, height: 18),
          // ),
          // const SizedBox(height: 20),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 8),
          //   child: Text(
          //     villaapt.flightClass,
          //     style: GoogleFonts.poppins(fontSize: 12),
          //   ),
          // ),
          const SizedBox(height: 6),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              villaapt.price.toUpperCase(),
              style: GoogleFonts.poppins(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
