import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:travessence/config/config.dart';
import 'package:travessence/loading/loading_screen_new.dart';
import 'package:travessence/routes/app_pages.dart';
import 'package:travessence/utils/dismisskeyboard.dart';
import 'package:travessence/utils/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Config.load();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return DismissKeyboard(
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Travessence',
        theme: ThemeData(
          useMaterial3: false,
          primaryColor: MyColor.travessence,
          focusColor: MyColor.travessence5,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          inputDecorationTheme: InputDecorationTheme(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: MyColor.travessence),
            ),
          ),
          primaryIconTheme: IconThemeData(color: MyColor.travessence),
        ),

        // 👇 selalu masuk splash dulu
        home: const SplashScreenNew(),
        getPages: AppPages.routes,
      ),
    );
  }
}
