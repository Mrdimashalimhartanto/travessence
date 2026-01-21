part of 'pages.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime timeBackPressed = DateTime.now();
  int current = 0;
  int selectedCategoryIndex = 0;
  // int selectedPesawatIndex = 0;
  List persons = [];
  List original = [];
  List<PromoModel> get filteredPromo {
    final selectedCategory = categoryItems[selectedCategoryIndex];

    if (selectedCategory == "Semua") {
      return promoList;
    }

    return promoList
        .where((promo) => promo.category == selectedCategory)
        .toList();
  }

  TextEditingController txtQuery = new TextEditingController();

  void loadData() async {
    String jsonStr = await rootBundle.loadString('assets/persons.json');
    var json = jsonDecode(jsonStr);
    persons = json;
    original = json;
    setState(() {});
  }

  final List<String> categoryItems = const [
    "Semua",
    "Pesawat",
    "Hotel",
    "Villa & Apt",
    "To Do",
    "Kereta Api",
    "Sewa Mobil",
    "Jemputan Bandara",
  ];

  @override
  Widget build(BuildContext context) {
    // Widget
    Widget detailmember() {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        height: 200,
        width: 390,
        decoration: BoxDecoration(
          // color: Colors.grey.shade400,
          image: DecorationImage(
            image: NetworkImage(
              'https://images.unsplash.com/photo-1492684223066-81342ee5ff30?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
            ),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 27.0, left: 24),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nikmati berbagai macam promo \n yang ada disini',
                    style: GoogleFonts.montserrat(
                      color: Color(0xffF8F7FD),
                      fontSize: 19,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(height: 8),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: travessence,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(17),
                      ),
                      side: BorderSide(color: travessence4),
                    ),
                    onPressed: () {},
                    child: Text(
                      'Lihat promo',
                      style: GoogleFonts.montserrat(
                        color: Color(0xffF8F7FD),
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    }

    Widget promotravessence() {
      return Padding(
        padding: const EdgeInsets.only(left: 8, right: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Rekomendasi atraksi seru buatmu',
                  style: GoogleFonts.montserrat(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Yuk Cek promo harian untuk melihat rekomendasi wisata kamu',
                  style: GoogleFonts.poppins(
                    color: Colors.grey.shade800,
                    fontSize: 10,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }

    Widget travessenceTitleMoreMenu() {
      return Padding(
        padding: EdgeInsets.only(top: 30.0, left: 16, right: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Layanan Teratas',
              style: GoogleFonts.poppins(
                color: travessence,
                fontSize: 18,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
      );
    }

    Widget menumore() {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: travessence,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      height: 50,
                      width: 50,
                      child: Image.network(
                        'https://cdn-icons-png.flaticon.com/512/3127/3127363.png',
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Pesawat',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: travessence,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: travessence,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      height: 50,
                      width: 50,
                      child: Image.network(
                        'https://cdn-icons-png.flaticon.com/512/3310/3310553.png',
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Hotel',
                      style: GoogleFonts.poppins(
                        color: travessence,
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () => print('GoFood'),
                      child: Container(
                        decoration: BoxDecoration(
                          color: travessence,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        height: 50,
                        width: 50,
                        child: Image.network(
                          'https://cdn-icons-png.flaticon.com/512/2387/2387679.png',
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'To Do',
                      style: GoogleFonts.poppins(
                        color: travessence,
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () => print('GoSend'),
                      child: Container(
                        decoration: BoxDecoration(
                          color: travessence,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        height: 50,
                        width: 50,
                        child: Image.network(
                          'https://cdn-icons-png.flaticon.com/512/713/713309.png',
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Kereta Api',
                      style: GoogleFonts.poppins(
                        color: travessence,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      );
    }

    Widget titlemenu() {
      return Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Menu Travessence',
                  style: GoogleFonts.montserrat(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }

    moremenu(context) {
      showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(16.0),
            topLeft: Radius.circular(16.0),
          ),
        ),
        builder: (BuildContext c) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.80,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  travessenceTitleMoreMenu(),
                  SizedBox(height: 18),
                  menumore(),
                  SizedBox(height: 18),
                  // MenuMore(),
                  SizedBox(height: 18),
                  // JudulWisata(),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        // detailmember2(),
                        // detailmember2(),
                        // detailmember2(),
                      ],
                    ),
                  ),
                  SizedBox(height: 18),
                  // JudulWisata(),
                  SizedBox(height: 18),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        // detailmember2(),
                        // detailmember2(),
                        // detailmember2(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    }

    Widget menutravessence() {
      return Column(
        children: <Widget>[
          const SizedBox(height: 15),

          /// ROW 1
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, '/akomodasi'),
                child: TravessenceMenu(
                  title: "Akomodasi",
                  image:
                      'https://cdn-icons-png.flaticon.com/512/9434/9434409.png',
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, '/atraksi'),
                child: TravessenceMenu(
                  title: "Atraksi",
                  image:
                      'https://cdn-icons-png.flaticon.com/512/2071/2071392.png',
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, '/villa_apt'),
                child: TravessenceMenu(
                  title: "Villa & Apt",
                  image:
                      'https://cdn-icons-png.flaticon.com/512/3033/3033267.png',
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, '/event'),
                child: TravessenceMenu(
                  title: "Event",
                  image:
                      'https://cdn-icons-png.flaticon.com/512/2558/2558944.png',
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          /// ROW 2
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, '/spa-kecantikan'),
                child: TravessenceMenu(
                  title: "Spa &\nKecantikan",
                  image:
                      'https://cdn-icons-png.flaticon.com/512/1329/1329088.png',
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, '/sewa-mobil'),
                child: TravessenceMenu(
                  title: "Sewa\nMobil",
                  image:
                      'https://cdn-icons-png.flaticon.com/512/5044/5044511.png',
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, '/tempat_bermain'),
                child: TravessenceMenu(
                  title: "Tempat\nBermain",
                  image:
                      'https://cdn-icons-png.flaticon.com/512/10155/10155168.png',
                ),
              ),

              /// MORE
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: travessence,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 50,
                    width: 50,
                    child: Center(
                      child: Image.network(
                        'https://cdn-icons-png.flaticon.com/512/10172/10172145.png',
                        height: 38,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const SizedBox(
                    height: 36, // 🔑 samain tinggi text
                    child: Text(
                      'More',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      );
    }

    Widget kontentmember() {
      return Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(children: [detailmember()]),
          ),
        ],
      );
    }

    Widget buttonlihatpromo() {
      return Padding(
        padding: EdgeInsets.only(bottom: 1),
        child: GestureDetector(
          onTap: () {},
          child: Container(
            height: 40,
            margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            decoration: BoxDecoration(
              color: travessence,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Text(
                    'Lihat Promo',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    Widget categories({
      required List<String> items,
      required int selectedIndex,
      required ValueChanged<int> onTap,
    }) {
      return SizedBox(
        height: 34,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: items.length,
          separatorBuilder: (_, __) => const SizedBox(width: 8),
          itemBuilder: (context, i) {
            final selected = i == selectedIndex;
            return InkWell(
              onTap: () => onTap(i),
              borderRadius: BorderRadius.circular(18),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: selected ? const Color(0xFFE6F0FF) : Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(
                    color: selected
                        ? const Color(0xFF3A7BFF)
                        : const Color(0xFFE6E8EF),
                  ),
                ),
                child: Text(
                  items[i],
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: selected
                        ? const Color(0xFF2563EB)
                        : const Color(0xFF111827),
                  ),
                ),
              ),
            );
          },
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: [
                WillPopScope(
                  child: Stack(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Container(
                            width: double.infinity,
                            height:
                                190 + MediaQuery.of(context).viewPadding.top,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                  'https://images.unsplash.com/photo-1462400362591-9ca55235346a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1432&q=80',
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height: 100,
                            color: Colors.white,
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(
                                15.0 + MediaQuery.of(context).viewPadding.top,
                              ),
                              child: Center(
                                child: Text(
                                  'Welcome to Travessence',
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                            Card(
                              color: Colors.white,
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  children: <Widget>[
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'OVO Balance',
                                          style: GoogleFonts.poppins(
                                            color: Colors.black,
                                            fontWeight: FontWeight.normal,
                                            fontSize: 12,
                                          ),
                                        ),
                                        Spacer(),
                                        Align(
                                          alignment: Alignment.topCenter,
                                          child: Text(
                                            'RP',
                                            style: GoogleFonts.poppins(
                                              color: Colors.black,
                                              fontWeight: FontWeight.normal,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 4),
                                        Text(
                                          "2.980.000",
                                          style: GoogleFonts.poppins(
                                            color: Colors.black,
                                            fontWeight: FontWeight.normal,
                                            fontSize: 12,
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                            15,
                                          ),
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 5,
                                              vertical: 5,
                                            ),
                                            color: Colors.grey[300],
                                            child: Icon(
                                              Icons.arrow_forward_ios,
                                              size: 15,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Divider(thickness: 1),
                                    //  travessence MENU
                                    const SizedBox(height: 10),
                                    // bisa jadi card member disini
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            titlemenu(),
                            menutravessence(),
                            SizedBox(height: 20),
                            kontentmember(),
                            Divider(
                              thickness: 1,
                              color: Color(0xffEFEFEF),
                              indent: 8,
                              endIndent: 8,
                            ),
                            SizedBox(height: 20),
                            promotravessence(),
                            SizedBox(height: 20),
                            categories(
                              items: categoryItems,
                              selectedIndex: selectedCategoryIndex,
                              onTap: (index) {
                                setState(() {
                                  selectedCategoryIndex = index;
                                });
                              },
                            ),
                            SizedBox(height: 10),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: filteredPromo
                                    .map((promo) => PromoCard(promo: promo))
                                    .toList(),
                              ),
                            ),
                            buttonlihatpromo(),
                            Divider(
                              thickness: 4,
                              color: Color(0xffEFEFEF),
                              indent: 1,
                              endIndent: 8,
                            ),
                            Column(
                              children: [
                                SectionHeader(
                                  title: "Recommended Food For You",
                                  subtitle:
                                      "Enter your details below to create your account and get started",
                                ),
                                SizedBox(height: 10),
                                RecommendedFoodSection(),
                                SizedBox(height: 40),
                                SectionHeader(
                                  title: 'Destination Popular for you',
                                  subtitle:
                                      'Enter your details belom to create your account and get started',
                                ),
                                DestinationPopularSection(),
                                SizedBox(height: 10),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  onWillPop: () async {
                    final difference = DateTime.now().difference(
                      timeBackPressed,
                    );
                    final isExitWarning =
                        difference >= const Duration(seconds: 2);
                    timeBackPressed = DateTime.now();
                    if (isExitWarning) {
                      Fluttertoast.showToast(
                        msg: "Please tap again to exit",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.TOP,
                        timeInSecForIosWeb: 1,
                        backgroundColor: travessence,
                        textColor: Colors.white,
                        fontSize: 16.0,
                      );
                      return false;
                    } else {
                      Fluttertoast.cancel();
                      return true;
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
