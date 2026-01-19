part of 'widgets.dart';

class TravessenceMenu extends StatelessWidget {
  const TravessenceMenu({
    super.key,
    required this.title,
    required this.image,
    this.size = 36.0,
  });

  final String title;
  final String image;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: travessence,
            borderRadius: BorderRadius.circular(10),
          ),
          height: 50,
          width: 50,
          child: Center(child: Image.network(image, height: size)),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 32, // 🔑 FIX sejajar
          child: Text(
            title,
            textAlign: TextAlign.center,
            maxLines: 2,
            style: GoogleFonts.poppins(fontSize: 12, color: Colors.black),
          ),
        ),
      ],
    );
  }
}
