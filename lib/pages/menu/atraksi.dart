part of 'menu.dart';

class Atraksi extends StatefulWidget {
  const Atraksi({super.key});

  static const Color primaryBlue = Color(0xFF0B3C78);
  static const Color lightBlue = Color(0xFFF3F6FB);

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _header(),
            _promoBanner(),
            _searchCard(),
            const SizedBox(height: 24),
            _promoSection(),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
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

  // ================= HEADER =================
  Widget _header() {
    return Stack(
      children: [
        Image.network(
          'https://images.unsplash.com/photo-1529070538774-1843cb3265df',
          height: 220,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Container(
          height: 220,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [Colors.black.withOpacity(0.55), Colors.transparent],
            ),
          ),
        ),
        Positioned(
          left: 20,
          bottom: 28,
          child: Text(
            'Cek Tiket Pesawat',
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  // ================= PROMO BANNER =================
  Widget _promoBanner() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF0B3C78), Color(0xFF7FB3C8)],
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.workspace_premium, color: Colors.orange),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              'Jaminan Harga Termurah! Ada tiket domestik yang lebih murah? '
              'Klaim 2x selisih harganya! (*)',
              style: GoogleFonts.poppins(color: Colors.white, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }

  // ================= SEARCH CARD =================
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

  Widget _locationTile({
    required IconData icon,
    required String title,
    required String subtitle,
    bool isPlaceholder = false,
  }) {
    return Row(
      children: [
        Icon(icon, color: Colors.grey),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: isPlaceholder ? Colors.grey : Colors.black,
              ),
            ),
            if (subtitle.isNotEmpty)
              Text(
                subtitle,
                style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey),
              ),
          ],
        ),
        const Spacer(),
        const Icon(Icons.swap_vert, color: Colors.black),
      ],
    );
  }

  Widget _dateRow() {
    return Row(
      children: [
        const Icon(Icons.calendar_month, color: Colors.grey),
        const SizedBox(width: 12),
        Text(
          'Sel, 11 Mar',
          style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
        ),
        const Spacer(),
        Text('Pulang-pergi?', style: GoogleFonts.poppins(fontSize: 12)),
        const SizedBox(width: 8),
        Switch(value: false, onChanged: (_) {}),
      ],
    );
  }

  Widget _infoTile({required IconData icon, required String title}) {
    return Row(
      children: [
        Icon(icon, color: Colors.grey),
        const SizedBox(width: 12),
        Text(title, style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
      ],
    );
  }

  Widget _searchButton() {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Atraksi.primaryBlue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        onPressed: () {},
        child: Text(
          'Ayo Cari',
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  // ================= PROMO SECTION =================
  Widget _promoSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.discount, color: Colors.blue),
              const SizedBox(width: 8),
              Text(
                'Kuy, cek promo sebelum bepergian!',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 140,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              separatorBuilder: (_, __) => const SizedBox(width: 12),
              itemBuilder: (_, index) => _promoCard(),
            ),
          ),
          const SizedBox(height: 16),
          _seeAllPromoButton(),
        ],
      ),
    );
  }

  Widget _promoCard() {
    return Container(
      width: 220,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        image: const DecorationImage(
          image: NetworkImage(
            'https://images.unsplash.com/photo-1529070538774-1843cb3265df',
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _seeAllPromoButton() {
    return SizedBox(
      width: double.infinity,
      height: 44,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue.shade200,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: () {},
        child: Text(
          'Lihat semua promo',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
