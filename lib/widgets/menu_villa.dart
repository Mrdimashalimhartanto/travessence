part of 'widgets.dart';

class MenuVilla extends StatelessWidget {
  final String title;
  final String image;

  const MenuVilla({super.key, required this.title, required this.image});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 56,
          height: 56,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: MyColor.travessence,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Image.network(image),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          textAlign: TextAlign.center,
          // maxLines: 2,
          // overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
