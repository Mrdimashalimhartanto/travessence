part of 'widgets.dart';

class TravessenceMenu extends StatelessWidget {
  const TravessenceMenu({
    super.key,
    required this.title,
    required this.image,
    this.size = 20.0,
  });

  final String title;
  final String image;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: travessence,
                borderRadius: BorderRadius.circular(10),
              ),
              height: 50,
              width: 50,
              child: Image(height: size, image: NetworkImage(image)),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Text(
          title,
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontWeight: FontWeight.normal,
            fontSize: 12,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
