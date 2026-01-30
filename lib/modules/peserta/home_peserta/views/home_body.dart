import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:travessence/modules/peserta/home_peserta/controllers/home_peserta_controller.dart';

class HomeBody extends GetView<HomePesertaController> {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: [
                // WillPopScope(
                //   child: Stack(),
                //   onWillPop: () async {
                //     final difference = DateTime.now().difference(
                //       timeBackPressed,
                //     );
                //   },
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
