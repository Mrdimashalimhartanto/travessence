import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeUserController extends GetxController {
  RxBool isLoadingPareng = false.obs;

  // Index untuk halaman yang dituju
  RxInt navBarIndex = 0.obs;

  // Membantu untuk pindah dari halaman satu ke yang lainnya
  late PageController pageController;

  // Bottom Navbar Items
  final bottomNavbarItem = const <BottomNavigationBarItem>[
    BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
    BottomNavigationBarItem(icon: Icon(Icons.history), label: 'History'),
    BottomNavigationBarItem(icon: Icon(Icons.business), label: 'Provider'),
    BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
  ];

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(initialPage: navBarIndex.value);
    pageController.addListener(() {
      navBarIndex.value = pageController.page!.toInt();
    });
  }
}
