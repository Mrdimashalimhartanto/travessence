import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travessence/modules/peserta/home_user/views/pages/dashboard/controller/dashboard_controller.dart';

class CardPromo extends GetView<DashboardController> {
  const CardPromo({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                  borderRadius: BorderRadius.circular(15),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    color: Colors.grey[300],
                    child: Icon(Icons.arrow_forward_ios, size: 15),
                  ),
                ),
              ],
            ),
            Divider(),
            //  travessence MENU
            const SizedBox(height: 10),
            // bisa jadi card member disini
          ],
        ),
      ),
    );
  }
}
