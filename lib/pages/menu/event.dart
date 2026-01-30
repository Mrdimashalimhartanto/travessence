part of 'menu.dart';

class Event extends StatelessWidget {
  const Event({super.key});

  @override
  Widget build(BuildContext context) {
    // Widget
    Widget heroHeader() {
      return Stack(
        children: [
          SizedBox(
            height: 190,
            width: double.infinity,
            child: Image.network(
              'https://images.unsplash.com/photo-1638132704795-6bb223151bf7?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            height: 190,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black.withOpacity(0.35),
                  Colors.black.withOpacity(0.05),
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
          Positioned(
            left: 16,
            bottom: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Event seru terbaik di setiap musim",
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),

                Text(
                  'Event seru menanti kamu, yuk cek keseruannya',
                  style: GoogleFonts.poppins(
                    color: Colors.yellow,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    }

    Widget priceGuaranteeBanner() {
      return Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: MyColor.travessence,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Udah punya aku belum ?",
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Buat akun atau log in yuk. Ada diskon dan benefit biar kamu makin cuan!",
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    height: 42,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: MyColor.travessence3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        elevation: 0,
                      ),
                      onPressed: () {},
                      child: Text(
                        "Log in",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          color: MyColor.travessence,
                          fontSize: 19,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // const SizedBox(width: 6),
            // const Icon(Icons.chevron_right, color: Colors.white),
          ],
        ),
      );
    }

    Widget sectionTitle(String text) {
      return Align(
        alignment: Alignment.centerLeft,
        child: Text(
          text,
          style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w700),
        ),
      );
    }

    return Scaffold(
      backgroundColor: MyColor.travessence5,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: heroHeader()),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.fromLTRB(16, 12, 16, 14),
              child: Column(
                children: [
                  priceGuaranteeBanner(),
                  SizedBox(height: 12),
                  sectionTitle('Menampilkan 19 Hasil'),
                  SizedBox(height: 12),
                  SingleChildScrollView(
                    child: Column(
                      children: imageListEvent.map((event) {
                        return EventCard(event: event);
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
