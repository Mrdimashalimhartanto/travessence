part of 'pages.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Welcome to Travessence!',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: travessence,
          ),
        ),
      ),
    );
  }
}
