import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

import 'package:travessence/routes/app_pages.dart';
import 'package:travessence/services/network_handler.dart';
import 'package:travessence/utils/size_config.dart';
import 'package:travessence/utils/theme.dart';

class SplashScreenNew extends StatefulWidget {
  const SplashScreenNew({super.key});

  @override
  State<SplashScreenNew> createState() => _SplashScreenNewState();
}

class _SplashScreenNewState extends State<SplashScreenNew> {
  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    // biar splash keliatan dikit
    await Future.delayed(const Duration(seconds: 2));
    final result = await NetworkHandler.checkKeyFirst('token', 'role');
    final bool isLogin = result?['token'] == true;
    // sesuai schema lu: setelah splash → onboarding
    Get.offAllNamed(Routes.ONBOARDING);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      backgroundColor: MyColor.travessence,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(),
            Column(children: [Image.asset('assets/logo_travenssence.png')]),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              child: Text(
                'Travenssence',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
