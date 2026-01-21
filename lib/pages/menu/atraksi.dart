part of 'menu.dart';

class Atraksi extends StatefulWidget {
  const Atraksi({super.key});

  @override
  State<Atraksi> createState() => _AtraksiState();
}

class _AtraksiState extends State<Atraksi> {
  String fromCity = "Jakarta (JKTC)";
  String toCity = "Mau ke mana ?";
  DateTime departDate = DateTime(2025, 3, 11);
  bool isRoundTrip = false;
  int passengers = 1;
  String cabin = "Ekonomi";
  int selectedPesawatIndex = 0;

  List<PesawatModel> get filteredPesawat {
    final selectedCategory = pesawatItems[selectedPesawatIndex];

    if (selectedCategory == "Semua") {
      return pesawatData;
    }

    return pesawatData
        .where((pesawat) => pesawat.category == selectedCategory)
        .toList();
  }

  final List<String> pesawatItems = const [
    'Sriwijaya Air',
    'Garuda Indonesia',
    'AirAsia',
    'Lion Air',
    'Citilink',
    'Batik Air',
    'Nam Air',
    'Wings Air',
    'TransNusa',
    'Pelita Air',
    'Trigana Air',
  ];

  String _formatDate(DateTime d) {
    const dayNames = ["Min", "Sen", "Sel", "Rab", "Kam", "Jum", "Sab"];
    const monthNames = [
      "Jan",
      "Feb",
      "Mar",
      "Apr",
      "Mei",
      "Jun",
      "Jul",
      "Agu",
      "Sep",
      "Okt",
      "Nov",
      "Des",
    ];
    final dayName = dayNames[d.weekday % 7];
    final monthName = monthNames[d.month - 1];
    return "$dayName, ${d.day} $monthName";
  }

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: departDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (picked != null) setState(() => departDate = picked);
  }

  void _swapCities() {
    setState(() {
      final tmp = fromCity;
      fromCity = toCity;
      toCity = tmp;
    });
  }

  void _openPassengersCabinSheet() {
    showModalBottomSheet(
      context: context,
      showDragHandle: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
      ),
      builder: (_) {
        int tempPassengers = passengers;
        String tempCabin = cabin;

        return StatefulBuilder(
          builder: (context, setSheet) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 18),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Penumpang & Kabin",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 14),

                  // passengers
                  Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xFFE6E8EF)),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.person, size: 20),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            "Jumlah Penumpang",
                            style: GoogleFonts.poppins(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: tempPassengers <= 1
                              ? null
                              : () => setSheet(() => tempPassengers--),
                          icon: const Icon(Icons.remove_circle_outline),
                        ),
                        Text(
                          "$tempPassengers",
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        IconButton(
                          onPressed: () => setSheet(() => tempPassengers++),
                          icon: const Icon(Icons.add_circle_outline),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 12),

                  // cabin
                  Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xFFE6E8EF)),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.airline_seat_recline_normal, size: 20),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            "Kabin",
                            style: GoogleFonts.poppins(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        DropdownButton<String>(
                          value: tempCabin,
                          underline: const SizedBox(),
                          items: const [
                            DropdownMenuItem(
                              value: "Ekonomi",
                              child: Text("Ekonomi"),
                            ),
                            DropdownMenuItem(
                              value: "Premium Ekonomi",
                              child: Text("Premium Ekonomi"),
                            ),
                            DropdownMenuItem(
                              value: "Bisnis",
                              child: Text("Bisnis"),
                            ),
                            DropdownMenuItem(
                              value: "First",
                              child: Text("First"),
                            ),
                          ],
                          onChanged: (v) =>
                              setSheet(() => tempCabin = v ?? "Ekonomi"),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF0B3B74),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          passengers = tempPassengers;
                          cabin = tempCabin;
                        });
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Simpan",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  void _onSearch() {
    // TODO: Integrasi ke API / navigate ke result page
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "Cari: $fromCity → $toCity | ${_formatDate(departDate)} | $passengers pax, $cabin",
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F7FB),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: _heroHeader()),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 14),
              child: Column(
                children: [
                  _priceGuaranteeBanner(),
                  const SizedBox(height: 12),
                  _searchCard(),
                  const SizedBox(height: 16),
                  _promoSection(),
                  const SizedBox(height: 14),
                  _sectionTitle("Tiket pesawat mudik turun harga"),
                  const SizedBox(height: 10),
                  _airlineChips(
                    items: pesawatItems,
                    selectedIndex: selectedPesawatIndex,
                    onTap: (index) {
                      setState(() {
                        selectedPesawatIndex = index;
                      });
                    },
                  ),
                  const SizedBox(height: 12),
                  _horizontalFlightCards(),
                  // SingleChildScrollView(
                  //   scrollDirection: Axis.horizontal,
                  //   child: Row(
                  //     children: filteredPesawat
                  //         .map((pesawat) => PesawatCard(pesawat: pesawat))
                  //         .toList(),
                  //   ),
                  // ),
                  const SizedBox(height: 18),
                  _sectionTitle("Tiket pesawat terbang ke luar negeri"),
                  const SizedBox(height: 10),
                  _airlineChips(
                    items: pesawatItems,
                    selectedIndex: selectedPesawatIndex,
                    onTap: (index) {
                      setState(() {
                        selectedPesawatIndex = index;
                      });
                    },
                  ),
                  const SizedBox(height: 12),
                  _horizontalFlightCards(isInternational: true),
                  const SizedBox(height: 18),
                  _paylaterBanner(),
                  const SizedBox(height: 16),
                  _articleSection(),
                  const SizedBox(height: 28),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ===================== UI PARTS =====================

  Widget _heroHeader() {
    return Stack(
      children: [
        SizedBox(
          height: 190,
          width: double.infinity,
          child: Image.network(
            "https://images.unsplash.com/photo-1502920514313-52581002a659?q=80&w=1600&auto=format&fit=crop",
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
          child: Text(
            "Cek Atraksi Terbaikmu di Sini!",
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  Widget _priceGuaranteeBanner() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: travessence,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(
              Icons.workspace_premium,
              color: Colors.white,
              size: 18,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              "Jaminan Harga Termurah! Ada tiket domestik yang lebih murah? Klaim 2x selisih harganya!",
              style: GoogleFonts.poppins(
                fontSize: 12,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(width: 6),
          const Icon(Icons.chevron_right, color: Colors.white),
        ],
      ),
    );
  }

  Widget _searchCard() {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 14,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        children: [
          // from-to block
          Stack(
            children: [
              Column(
                children: [
                  _inputTile(
                    icon: Icons.flight_takeoff,
                    title: fromCity,
                    subtitle: "Dari",
                    onTap: () {
                      // TODO open city picker
                    },
                  ),
                  const SizedBox(height: 10),
                  _inputTile(
                    icon: Icons.flight_land,
                    title: toCity,
                    subtitle: "Ke",
                    onTap: () {
                      // TODO open city picker
                    },
                  ),
                ],
              ),
              Positioned(
                right: 8,
                top: 28,
                child: InkWell(
                  onTap: _swapCities,
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: const Color(0xFFE6E8EF)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.06),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: const Icon(Icons.swap_vert, size: 18),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          // date + roundtrip switch row
          Row(
            children: [
              Expanded(
                child: _inputTile(
                  icon: Icons.calendar_month,
                  title: _formatDate(departDate),
                  subtitle: "Tanggal berangkat",
                  onTap: _pickDate,
                ),
              ),
              const SizedBox(width: 12),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFFE6E8EF)),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Text(
                      "Pulang-pergi?",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Switch(
                      value: isRoundTrip,
                      onChanged: (v) => setState(() => isRoundTrip = v),
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          _inputTile(
            icon: Icons.person,
            title: "$passengers Penumpang, $cabin",
            subtitle: "Penumpang & Kabin",
            onTap: _openPassengersCabinSheet,
          ),

          const SizedBox(height: 14),

          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF0B3B74),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: _onSearch,
              child: Text(
                "Ayo Cari",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _inputTile({
    required IconData icon,
    required String title,
    required String subtitle,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFFE6E8EF)),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(icon, size: 20, color: const Color(0xFF2B3A55)),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    subtitle,
                    style: GoogleFonts.poppins(
                      fontSize: 11,
                      color: Colors.black54,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF111827),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _promoSection() {
    return Column(
      children: [
        Row(
          children: [
            Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                color: const Color(0xFFEFF6FF),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(
                Icons.discount,
                size: 18,
                color: Color(0xFF2563EB),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                "Kuy, cek promo sebelum bepergian!",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 110,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              const SizedBox(width: 2),
              _promoCard(
                imageUrl:
                    "https://images.unsplash.com/photo-1529070538774-1843cb3265df?q=80&w=1200&auto=format&fit=crop",
              ),
              _promoCard(
                imageUrl:
                    "https://images.unsplash.com/photo-1526772662000-3f88f10405ff?q=80&w=1200&auto=format&fit=crop",
              ),
              _promoCard(
                imageUrl:
                    "https://images.unsplash.com/photo-1473625247510-8ceb1760943f?q=80&w=1200&auto=format&fit=crop",
              ),
              const SizedBox(width: 10),
            ],
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: double.infinity,
          height: 42,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: travessence,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 0,
            ),
            onPressed: () {},
            child: Text(
              "Lihat semua promo",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _promoCard({required String imageUrl}) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      width: 170,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
            colors: [Colors.black.withOpacity(0.25), Colors.transparent],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
      ),
    );
  }

  Widget _sectionTitle(String text) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w700),
      ),
    );
  }

  Widget _airlineChips({
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
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
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

  Widget _horizontalFlightCards({bool isInternational = false}) {
    return SizedBox(
      height: 250,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _flightCard(
            title: isInternational ? "Jakarta → Bali" : "Jakarta → Palembang",
            dateText: isInternational ? "03 Mei 25" : "04 Apr 2025",
            airline: isInternational ? "AirAsia" : "Sriwijaya Air",
            badgeText: isInternational ? "Diskon 20%" : "Harga Promo",
            price: "IDR. 125.000",
            imageUrl:
                "https://images.unsplash.com/photo-1548013146-72479768bada?q=80&w=1200&auto=format&fit=crop",
          ),
          _flightCard(
            title: isInternational ? "Jakarta → Bali" : "Jakarta → Palembang",
            dateText: isInternational ? "03 Mei 25" : "04 Apr 2025",
            airline: isInternational ? "Garuda Indonesia" : "Sriwijaya Air",
            badgeText: isInternational ? "Diskon 20%" : "Harga Promo",
            price: "IDR. 125.000",
            imageUrl:
                "https://images.unsplash.com/photo-1533106418989-88406c7cc8ca?q=80&w=1200&auto=format&fit=crop",
          ),
          const SizedBox(width: 8),
        ],
      ),
    );
  }

  Widget _flightCard({
    required String title,
    required String dateText,
    required String airline,
    required String badgeText,
    required String price,
    required String imageUrl,
  }) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      width: 220,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.07),
            blurRadius: 14,
            offset: const Offset(0, 7),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // image with badge
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(14),
                ),
                child: Image.network(
                  imageUrl,
                  height: 140,
                  width: 220,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                right: 10,
                bottom: 10,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFF3B30),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Text(
                    badgeText,
                    style: GoogleFonts.poppins(
                      fontSize: 11,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 10, 12, 0),
            child: Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 13,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 6, 12, 0),
            child: Text(
              dateText,
              style: GoogleFonts.poppins(
                fontSize: 11,
                color: Colors.black54,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 6, 12, 0),
            child: Row(
              children: [
                const Icon(Icons.flight, size: 14, color: Colors.black54),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    airline,
                    style: GoogleFonts.poppins(
                      fontSize: 11,
                      color: Colors.black54,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 6, 12, 12),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    price,
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      fontWeight: FontWeight.w800,
                      color: const Color(0xFFFF3B30),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _paylaterBanner() {
    return Container(
      height: 74,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        image: const DecorationImage(
          image: NetworkImage(
            "https://images.unsplash.com/photo-1521791055366-0d553872125f?q=80&w=1200&auto=format&fit=crop",
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: Colors.black.withOpacity(0.25),
        ),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Pesan tiket pakai Paylater\nnikmatin bebas 2x cicilan",
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 12,
            ),
          ),
        ),
      ),
    );
  }

  Widget _articleSection() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 14,
            offset: const Offset(0, 7),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Cek Harga Tiket Pesawat Promo Tujuan Favoritmu!",
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "Sedang merencanakan liburan atau perjalanan bisnis menggunakan pesawat? "
            "Yuk, beli tiket pesawat di sini! Pilih rute favorit, bandingkan harga, "
            "dan temukan promo terbaik untuk perjalanan domestik maupun internasional.\n\n"
            "Nggak hanya itu, setiap kali beli tiket pesawat di sini kamu juga mendapatkan poin "
            "yang nantinya bisa ditukar dengan berbagai penawaran menarik.",
            style: GoogleFonts.poppins(
              fontSize: 12,
              height: 1.45,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 12),
          Align(
            alignment: Alignment.center,
            child: TextButton(
              onPressed: () {},
              child: Text(
                "Lihat Selengkapnya",
                style: GoogleFonts.poppins(fontWeight: FontWeight.w700),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
