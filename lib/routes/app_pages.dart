import 'package:get/get_navigation/get_navigation.dart';
import 'package:travessence/modules/home/bindings/home_binding.dart';
import 'package:travessence/modules/home/views/home_view.dart';
import 'package:travessence/modules/onboarding/binding/onboarding_binding.dart';
import 'package:travessence/modules/onboarding/views/onboarding_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.ONBOARDING,
      page: () => const OnboardingView(),
      binding: OnboardingBinding(),
    ),
  ];
}
