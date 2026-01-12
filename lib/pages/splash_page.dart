part of 'pages.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Timer(
      const Duration(seconds: 5),
      () => Navigator.pushNamed(context, '/welcome-page'),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: travessence,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Image.asset(
                  'assets/logo_travenssence.png',
                  width: 300,
                  height: 300,
                ),
                const SizedBox(height: 20),
              ],
            ),
            // buatkan progress indicator loading di bawah logo, jika jaringan nya bagus maka lanjut ke welcome page tapi jika jaringan kurang bagus maka munculkan loading terus
          ],
        ),
      ),
    );
  }
}
