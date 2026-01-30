part of 'pages.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    // Tombol Tengah (Cart)
    Widget cartButton() {
      return FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/cart-page');
        },
        backgroundColor: MyColor.travessence,
        shape: const CircleBorder(),
        child: Image.asset("assets/icon_cart.png", width: 20),
      );
    }

    // Widget CustomBottomNav
    Widget customBottomNav() {
      return BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        clipBehavior: Clip.antiAlias,
        color: MyColor.travessence,
        elevation: 0,
        child: BottomNavigationBar(
          iconSize: 22,
          backgroundColor: Colors.transparent,
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          currentIndex: _selectedIndex,
          // KUNCI: Buat font size label bawaan jadi 0 agar tidak merusak posisi teks custom kita
          selectedFontSize: 0,
          unselectedFontSize: 0,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              // KUNCI: Masukkan Icon dan Text ke dalam satu Column agar saat di-Padding, keduanya geser bareng
              icon: Padding(
                padding: const EdgeInsets.only(right: 25),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      "assets/icon_home.png",
                      width: 20,
                      color: _selectedIndex == 0
                          ? MyColor.travessence
                          : MyColor.travessence5,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "Home",
                      style: TextStyle(
                        fontSize: 12,
                        color: _selectedIndex == 0
                            ? MyColor.travessence
                            : MyColor.travessence5,
                      ),
                    ),
                  ],
                ),
              ),
              label: "", // Label asli dikosongkan
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(right: 45),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      "assets/icon_chat.png",
                      width: 20,
                      color: _selectedIndex == 1
                          ? MyColor.travessence
                          : MyColor.travessence5,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "Chat",
                      style: TextStyle(
                        fontSize: 12,
                        color: _selectedIndex == 1
                            ? MyColor.travessence
                            : MyColor.travessence5,
                      ),
                    ),
                  ],
                ),
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(left: 45),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      "assets/icon_wishlist.png",
                      width: 20,
                      color: _selectedIndex == 2
                          ? MyColor.travessence
                          : MyColor.travessence5,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "Wishlist",
                      style: TextStyle(
                        fontSize: 12,
                        color: _selectedIndex == 2
                            ? MyColor.travessence
                            : MyColor.travessence5,
                      ),
                    ),
                  ],
                ),
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      "assets/icon_profile.png",
                      width: 20,
                      color: _selectedIndex == 3
                          ? MyColor.travessence
                          : MyColor.travessence5,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "Profile",
                      style: TextStyle(
                        fontSize: 12,
                        color: _selectedIndex == 3
                            ? MyColor.travessence
                            : MyColor.travessence5,
                      ),
                    ),
                  ],
                ),
              ),
              label: "",
            ),
          ],
        ),
      );
    }

    Widget body() {
      switch (_selectedIndex) {
        case 0:
          return const HomePage();
        case 1:
          return const ChatPage();
        case 2:
          return const WishlistPage();
        case 3:
          return const ProfilePage();
        default:
          return const HomePage();
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      extendBody: true,
      floatingActionButton: cartButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: customBottomNav(),
      body: Padding(
        padding: EdgeInsets.only(
          bottom:
              MediaQuery.of(context).padding.bottom +
              kBottomNavigationBarHeight +
              40,
        ),
        child: body(),
      ),
    );
  }
}
