import 'package:travessence/modules/home/views/widgets/card_opsi_travel.dart';
import 'package:travessence/modules/home/views/widgets/card_promo.dart';
import 'package:travessence/modules/home/views/widgets/categories.dart';
import 'package:travessence/modules/home/views/widgets/detail_member.dart';
import 'package:travessence/modules/home/views/widgets/menu_travenssence.dart';
import 'package:travessence/modules/home/views/widgets/title_travessence.dart';
import 'package:travessence/utils/mytextstyle.dart';
import 'package:travessence/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Widget promotravenssence() {
      return Padding(
        padding: EdgeInsets.only(left: 8, right: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Rekomendasi atraksi seru buatmu',
                  style: MyTextStyle.primary20600,
                ),
                SizedBox(height: 4),
                Text(
                  'Yuk Cek promo harian untuk melihat rekomendasi wisata kamu',
                  style: MyTextStyle.primaryPromo,
                ),
              ],
            ),
          ],
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
                            CardPromo(),
                            SizedBox(height: 20),
                            TitlePromo(),
                            SizedBox(height: 10),
                            DetailMember(),
                            SizedBox(height: 10),
                            MenuTravenssence(),
                            SizedBox(height: 10),
                            Divider(),
                            SizedBox(height: 10),
                            promotravenssence(),
                            SizedBox(height: 10),
                            Categories(),
                            SizedBox(height: 10),
                            Obx(() {
                              final promos = controller.filteredPromo;

                              if (promos.isEmpty) {
                                return const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 16),
                                  child: Center(
                                    child: Text('Promo tidak tersedia'),
                                  ),
                                );
                              }

                              return SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                ),
                                child: Row(
                                  children: promos
                                      .map(
                                        (promo) => Padding(
                                          padding: const EdgeInsets.only(
                                            right: 12,
                                          ),
                                          child: CardOpsiTravel(promo: promo),
                                        ),
                                      )
                                      .toList(),
                                ),
                              );
                            }),
                            SizedBox(height: 10),
                            SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ],
                  ),
                  onWillPop: () async {
                    final difference = DateTime.now().difference(
                      controller.timeBackPressed,
                    );
                    final isExitWarning =
                        difference >= const Duration(seconds: 2);
                    controller.timeBackPressed = DateTime.now();
                    if (isExitWarning) {
                      Fluttertoast.showToast(
                        msg: "Please tap again to exit",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.TOP,
                        timeInSecForIosWeb: 1,
                        backgroundColor: MyColor.travessence,
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
