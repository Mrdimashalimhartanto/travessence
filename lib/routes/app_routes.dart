// ignore_for_file: constant_identifier_names

part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const HOME = _Paths.HOME;
  static const ONBOARDING = _Paths.ONBOARDING;
  static const LOGIN_REGISTER = _Paths.LOGIN_REGISTER;
  static const HOME_PESERTA = _Paths.HOME_PESERTA;
  static const ADMIN_TRAVESSENCE = _Paths.ADMIN_TRAVESSENCE;

  // Menu Menu Routes
  static const AKOMODASI = _Paths.AKOMODASI;
  static const ATRAKSI = _Paths.ATRAKSI;
  static const VILLAAPT = _Paths.VILLAAPT;
  static const EVENT = _Paths.EVENT;
  static const SPAKECANTIKAN = _Paths.SPAKECANTIKAN;
  static const SEWAMOBIL = _Paths.SEWAMOBIL;
  static const TEMPATBERMAIN = _Paths.TEMPATBERMAIN;
  static const MORE = _Paths.MORE;
}

abstract class _Paths {
  _Paths._();
  static const HOME = '/home';
  static const ONBOARDING = '/onboarding';
  static const LOGIN_REGISTER = '/login-register';
  static const HOME_PESERTA = '/home-peserta';
  static const ADMIN_TRAVESSENCE = '/admin-travessence';

  // Menu - Menu
  static const AKOMODASI = '/akomodasi';
  static const ATRAKSI = '/atraksi';
  static const VILLAAPT = '/villa-apt';
  static const EVENT = '/event';
  static const SPAKECANTIKAN = '/spa-kecantikan';
  static const SEWAMOBIL = '/sewa-mobil';
  static const TEMPATBERMAIN = '/tempat-bermain';
  static const MORE = '/more';
}
