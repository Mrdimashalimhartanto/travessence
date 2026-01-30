import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travessence/modules/home/views/widgets/menu_container.dart';
import 'package:travessence/modules/peserta/home_user/views/pages/dashboard/controller/dashboard_controller.dart';
import 'package:travessence/routes/app_pages.dart';
import 'package:travessence/utils/mytextstyle.dart';

class MenuTravenssence extends GetView<DashboardController> {
  const MenuTravenssence({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(bottom: 10.0),
      padding: EdgeInsets.only(left: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Menu Travessence', style: MyTextStyle.primary20600),
          const Divider(),
          Column(
            children: <Widget>[
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  menuContainerTravessence(
                    context,
                    'assets/home/akomodasi.png',
                    'Akomodasi',
                    () => Get.toNamed(Routes.LOGIN_REGISTER),
                  ),
                  menuContainerTravessence(
                    context,
                    'assets/home/atraksi.png',
                    'Atraksi',
                    () => Get.toNamed(Routes.LOGIN_REGISTER),
                  ),
                  menuContainerTravessence(
                    context,
                    'assets/home/villaapt.png',
                    'Villa & Apt',
                    () => Get.toNamed(Routes.LOGIN_REGISTER),
                  ),
                  menuContainerTravessence(
                    context,
                    'assets/home/event.png',
                    'Event',
                    () => Get.toNamed(Routes.LOGIN_REGISTER),
                  ),
                ],
              ),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  menuContainerTravessence(
                    context,
                    'assets/home/spakecantikan.png',
                    'Spa &\nKecantikan',
                    () => Get.toNamed(Routes.LOGIN_REGISTER),
                  ),
                  menuContainerTravessence(
                    context,
                    'assets/home/sewamobil.png',
                    'Sewa\nMobil',
                    () => Get.toNamed(Routes.LOGIN_REGISTER),
                  ),
                  menuContainerTravessence(
                    context,
                    'assets/home/tempatbermain.png',
                    'Tempat\nBermain',
                    () => Get.toNamed(Routes.LOGIN_REGISTER),
                  ),
                  // menuContainerTravessence(
                  //   context,
                  //   'assets/home/more.png',
                  //   'More',
                  //   () {
                  //     Get.dialog(
                  //       const UserFailedPopUp(
                  //         textTitle: 'On Develop',
                  //         msgApi:
                  //             'Sedang dilakukan pengembangan untuk fitur ini',
                  //       ),
                  //     );
                  //   },
                  // ),

                  // menuContainerTravessence(
                  //   context,
                  //   'assets/home/more.png',
                  //   'More',
                  //   () => Get.toNamed(Routes.LOGIN_REGISTER),
                  // ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
